#include <stddef.h>
#include <linux/bpf.h>
#include <linux/in.h>
#include <linux/if_ether.h>
#include <linux/ip.h>
#include <linux/tcp.h>
#include <bpf_helpers.h>
#include <bpf_endian.h>

struct perf_trace_event
{
    __u64 timestamp;
    __u32 processing_time_ns;
    __u8 type;
};

#define TYPE_ENTER 1
#define TYPE_DROP 2
#define TYPE_PASS 3

#define BLOCKED_PORT 80

struct
{
    __uint(type, BPF_MAP_TYPE_PERF_EVENT_ARRAY);
    __uint(key_size, sizeof(__u32));
    __uint(value_size, sizeof(__u32));
} output_map SEC(".maps");

SEC("xdp")
int packet_filter(struct xdp_md *ctx)
{
    // Pointers to packet data
    void *data_end = (void *)(long)ctx->data_end;
    void *data = (void *)(long)ctx->data;

    // Parse Ethernet header
    struct ethhdr *eth = data;
    if ((void *)(eth + 1) > data_end)
        return XDP_PASS;

    // Only handle IPv4 packets
    if (eth->h_proto != __constant_htons(ETH_P_IP))
        return XDP_PASS;

    // Parse IP header
    struct iphdr *ip = data + sizeof(*eth);
    if ((void *)(ip + 1) > data_end)
        return XDP_PASS;

    // Only handle TCP packets
    if (ip->protocol != IPPROTO_TCP)
        return XDP_PASS;

    // Parse TCP header
    struct tcphdr *tcp = (void *)ip + ip->ihl * 4;
    if ((void *)(tcp + 1) > data_end)
        return XDP_PASS;

    // Check if the destination port is the blocked port
    if (tcp->dest == __constant_htons(BLOCKED_PORT))
    {
        // Drop packet
        return XDP_DROP;
    }

    // Allow packet to pass
    return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
