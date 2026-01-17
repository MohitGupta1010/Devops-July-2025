# How Automation Works

- Create Error Detection Pattern in CloudWatch
- Set up a Metric
- Monitor using Cloudwatch
- Set An Alarm, When Anomaly detects Alarm triggers
- Sent a notification using SNS
- also from alert triggers Ansible Playbook (pass data from alert to playbook)

## Example To Lock User after Failed Login
```yml
- name: Lock User
  hosts: all
  become: yes

  vars: 
    username: "{{user}}"
  tasks:
    - name: Lock this Linux User
      user:
        name: "{{username}}"
        password_lock: yes
```

## Example To Block IP
```yml
- name: Block IP
  hosts: all
  become: yes

  vars: 
    bad_ip: "{{ ip_address }}"
  tasks:
    - name: Block IP using Ip tables
      iptables:
        chain: INPUT
        source: "{{ bad_ip }}"
        jump: DROP
```

*Here IP Address or Username comes from Aler Payload, playbook runs on multiple servers*


### Advance Participants

**Task: try to achieve above example by your own as practice**

- Incase if you want to trigger ansible playbook from notification
- Alarm -> SNS -> Webhook -> Any Job Template -> Run Playbook