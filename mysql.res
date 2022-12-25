resource mysql {
    protocol B;

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
        disk /dev/vg0/mysql;
        address 10.129.0.25:7795;
        meta-disk internal;
    }
    on master
    {
        device /dev/drbd2;
        disk /dev/vg0/mysql;
        address 10.129.0.32:7795;
        meta-disk internal;
    }
}
