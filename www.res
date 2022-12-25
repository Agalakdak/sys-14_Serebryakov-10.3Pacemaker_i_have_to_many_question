resource www {
    protocol C;

    disk {
        fencing resource-only;
    }

    handlers {
        fence-peer "/usr/lib/drbd/crm-fence-peer.sh";
        after-resync-target "/usr/lib/drbd/crm-unfence-peer.sh";
    }
syncer {
        rate 110M;
    }
    on slave
    {
        device /dev/drbd2;
        disk /dev/vg0/www;
        address 10.129.0.25:7794;
        meta-disk internal;
    }
    on master
    {
        device /dev/drbd2;
        disk /dev/vg0/www;
        address 10.129.0.34:7794;
        meta-disk internal;
    }
}
