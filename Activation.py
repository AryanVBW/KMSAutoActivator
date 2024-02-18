import subprocess

def select_kms_server(server_type):
    if server_type == "Online":
        print("Select an online KMS server:")
        online_servers = [
            "kms.digiboy.ir",
            "hq1.chinancce.com",
            "54.223.212.31",
            "kms.cnlic.com",
            "kms.chinancce.com",
            "kms.ddns.net",
            "franklv.ddns.net",
            "k.zpale.com",
            "m.zpale.com",
            "mvg.zpale.com",
            "kms.shuax.com",
            "kensol263.imwork.net:1688",
            "xykz.f3322.org",
            "kms789.com",
            "dimanyakms.sytes.net:1688",
            "kms.03k.org:1688"
            # Add more servers as needed
        ]
        for i, server in enumerate(online_servers, 1):
            print(f"{i}. {server}")
        choice = int(input("Enter the number of the desired server: ")) - 1
        selected_server = online_servers[choice]
    elif server_type == "Offline":
        print("Select an offline KMS server:")
        offline_servers = [
            "kms.lotro.cc",
            "mhd.kmdns.net110",
            "noip.me",
            "45.78.3.223",
            "kms.didichuxing.coms",
            "zh.us.to",
            "toxykz.f3322.org",
            "192.168.2.81.2.7.0",
            "kms.guowaifuli.com",
            "106.186.25.2393",
            "rss.vicp.net:20439",
            "122.226.152.230",
            "222.76.251.188",
            "annychen.pw",
            "heu168.6655.la",
            "kms.aglc.cc",
            "kms.landiannews.com",
            "kms.xspace.in",
            "winkms.tk",
            "kms7.MSGuides.com",
            "kms8.MSGuides.com",
            "kms9.MSGuides.com"
            # Add more servers as needed
        ]
        for i, server in enumerate(offline_servers, 1):
            print(f"{i}. {server}")
        choice = int(input("Enter the number of the desired server: ")) - 1
        selected_server = offline_servers[choice]
    
    return selected_server

def main():
    print("Select KMS server type:")
    print("1. Online")
    print("2. Offline")
    server_type_choice = input("Enter your choice (1 or 2): ")

    if server_type_choice == "1":
        selected_server = select_kms_server("Online")
    elif server_type_choice == "2":
        selected_server = select_kms_server("Offline")

    # Set KMS server
    subprocess.run(["slmgr", "/skms", selected_server], check=True)

    # Activate Windows
    subprocess.run(["slmgr", "/ato"], check=True)

if __name__ == "__main__":
    main()
