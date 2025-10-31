# CHALLENGES

- Variables 

        Had issue with configuring the variables from secretmanager in the docker as it didnt have access to the cred, resolved it temporarily by using network as host

- Build Failing 
        
        Docker built kept failing as it was being run from super user

- Port Conflict 

        Had Port conflict with app and LB, as one was listening to 5000 and other on 80

- SSH VM

        Since VM using private IP and no external source or VPN tunnel or no bastion server I had to use IAP


