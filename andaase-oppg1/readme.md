__[TOC]__

## Formål med Modulene

Dette prosjektet består av flere Terraform-moduler som brukes til å automatisere oppsettet av infrastruktur i Azure. Hver modul har sitt eget formål:

### **Key Vault Modul**: 

Denne modulen oppretter en Azure Key Vault for å lagre nøkler (secrets). Her er ting som IDer, passord, brukernavn og hva enn annet man vil ha lagret trygt. Tilgang til keyvaultet reguleres med aksess policyer som man kan tildele til resusjer slik at bare de som skal bruke de har tilgang til de.

Jeg har laget en secret som inneholder både username og password for VMen. Passordet blir også generert med random_password som er flagget som sensitiv slik at det ikke outputtes til konsollen. i tillegg er SA access keyen lagret i sin egen secret. Disse sendes som output slik at de kan brukes til VMen. Disse er markert som sensitiv.

![Change to list](images\changelist.png)

Hvis jeg oppdaterer tilgangene slik at jeg får list, planner og applyer igjen vil jeg få tilganger til å gå inn å se på secretsene i Azure portal. Under kan du se et skjermbilde av hvordan en potensiell brukernavn og passord ville vært lagret. De er lagret som json format for å få både brukernavn og passord i samme secret som per oppgaven sier. Innså i ettertid at man også kan lagre navnet på secreten som brukernavnet og secreten inni.

![Secret](images\secrets.png)

### **Nettverksmodul**: 

Oppretter et virtuelt nettverk (VNet) med et subnett, samt et Network Security Group (NSG) for å beskytte VM-er mot eksterne trusler. Modulen håndterer også offentlig IP-oppsett.
NSGen er lagt til både private adresserommet og den ene offentlige adressen som er opprettet. Under ser du adresser som er tilordnet VMen som blir opprettet. Jeg har også en NSG som ikke er vist på bilde som har en regel som tillater port 22 (SSH) slik at vi kan teste å koble til senere.

![VMnetwork](images\network.png)

### **Lagringskonto Modul**: 

Setter opp en storage account og container som kan brukes til lagring av data. Mer spesifikt er det her vi oppretter keyvaultet. SA modulen outputter både storage account id og container id slik at disse kan brukes som input til keyvault modulen for å opprette keyvaultet inne i SA container. Se seksjon for modul dokumentasjon for nermere info.

### **VM Modul**: 
Oppretter en linux (Ubuntu 22.04lts) VM med en public og private IP. Brukernavn og passord tas fra keyvaultet gjennom keyvaultet sine output variables. VMen bruker også nettverkene fra nettverksmodulen slik at man kan få nett. Under kan du se et bilde fra at man får til å SSHe inn til VMen. Man må da selvfølgelig gi seg selv muligheten til å hente ut passordet ved å endre access policyen for å klare å logge inn.

![ssh to vm](images\ssh_vm.png)



## Modul dokumentasjon

### Keyvault
#### Input

- **kvname** (Påkrevd) - Navn på Key Vault som lagrer hemmeligheter og legitimasjon.
- **location** (Valgfri, standard: "westeurope") - Azure-regionen hvor ressursene vil bli distribuert.
- **rgname** (Påkrevd) - Navn på ressursgruppen hvor alle ressursene vil bli opprettet.
- **sa_accesskey_name** (Påkrevd) - Navn på hemmeligheten i Key Vault som lagrer tilgangsnøkkelen til lagringskontoen.
- **sa_id** (Påkrevd) - Tilgangsnøkkelen for lagringskontoen.
- **vmcredentials** (Påkrevd) - Navn på hemmeligheten i Key Vault for lagring av VM brukernavn og passord.
- **vm_username** (Påkrevd) - Administratorbrukernavnet for den virtuelle maskinen.

#### Output

- **keyvault_id** - ID-en til Key Vault som er opprettet. Denne brukes til å referere til Key Vault i andre ressurser.

- **vm_username** (Sensitiv) - Brukernavnet som er lagret som en hemmelighet i Key Vault. Denne brukes til pålogging på den virtuelle maskinen. Markert som sensitiv for å unngå utilsiktet visning i konsollen.

- **vm_password** (Sensitiv) - Passordet som er lagret som en hemmelighet i Key Vault.

### Network

#### Input

- **nsgname** (Påkrevd) - Navn på Network Security Group (NSG)
- **vnetname** (Påkrevd) - Navn på det virtuelle nettverket (VNet) hvor subnettet er plassert.
- **rgname** (Påkrevd) - Navn på ressursgruppen hvor alle ressursene vil bli opprettet.
- **location** (Valgfri, standard: "westeurope") - Azure-regionen hvor ressursene vil bli distribuert.
- **subnetname** (Påkrevd) - Navn på subnettet i det virtuelle nettverket (VNet).
- **public_ip_name** (Påkrevd) - Navn på den offentlige IP-adressen som er tilknyttet VM.

#### Output

- **vnet_id** - ID-en til det virtuelle nettverket (VNet) som er opprettet. Brukes til å referere VNet i andre ressurser.
- **subnet_id** - ID-en til subnettet i VNet. Kan brukes til å koble til en VM.
- **public_ip_id** - ID-en til den offentlige IP-adressen som kan tilordnes en f.eks en VM.
- **public_ip_address** - Den offentlige IP-adressen som kan tilordnes en VM.
- **nsg_id** - ID-en til Network Security Group (NSG) som beskytter nettverket mot trafikk. Standard åpen er TCP/22.


### Storage Account
#### Input

- **rgname** (Påkrevd) - Navn på ressursgruppen hvor alle ressursene vil bli opprettet.
- **location** (Valgfri, standard: "westeurope") - Azure-regionen hvor ressursene vil bli distribuert.
- **saname** (Påkrevd) - Navn på storage account som skal opprettes.
- **scname** (Påkrevd) - Navn på storage container i lagringskontoen.

#### Output

- **sa_id** - ID-en til den opprettede storage accounten. Brukes til å referere lagringskontoen i andre ressurser.
- **container_id** - ID-en til den opprettede containeren. Brukes til å administrere og få tilgang til data i storage accounten.

### VM
#### Input

- **rgname** (Påkrevd) - Navn på ressursgruppen hvor alle ressursene vil bli opprettet.
- **location** (Valgfri, standard: "westeurope") - Azure-regionen hvor ressursene vil bli distribuert.
- **subnet_id** (Påkrevd) - ID-en til subnettet i det virtuelle nettverket (VNet) hvor VM-en er tilkoblet.
- **vmname** (Påkrevd) - Navn på den virtuelle maskinen (VM).
- **username** (Påkrevd) - Administratorbrukernavnet for den virtuelle maskinen.
- **password** (Påkrevd) - Administratorpassordet for den virtuelle maskinen.
- **nicname** (Påkrevd) - Navn på Network Interface Card (NIC) som er tilknyttet VM.
- **nicipname** (Påkrevd) - Navn på IP-konfigurasjonen for Network Interface Card (NIC).
- **public_ip_id** (Påkrevd) - ID-en til den offentlige IP-adressen som er tilknyttet VM.
- **nsg_id** (Påkrevd) - ID-en til Network Security Group (NSG) som er tilknyttet VM.
- **vmpublisher, vmoffer, vmsku, vmversion, vmsize** (Valgfri) Standard for denne linux maskinen er Ubuntu (22.04lts). Man kan spesifisere disse for annen versjon. Se Terraform docs for mer info.


## Hvordan bruke scriptene

For å bruke scriptene kan man laste ned dette git repoet som zip fil. Derretter er det forventet at man har Terraform til VS code og Azure CLI slik at man kan logge inn for å klare å opprette ting i Azure. Se [her](https://www.youtube.com/watch?v=DTi2jZu8Cok) for hvordan dette gjøres.

1. Alle påkrevde felt til modulene må brukes. 
2. En resource group i mainfilen utenfor modulene er opprettet og kan da brukes som input til modulene som trenger dette.
3. Variabler brukt i root main.tf filen er definert i en egen terraform.tfvars fil. Se eksempelfil under. **Legg merke til at terraform version 4.0.X krever subscription id som IKKE er definert i eksempel tfvars filen**
4. Kjør `terraform init` (Hvis du allerede har initialisert kjør `terraform init -reconfigure`)
5. Kjør `terraform plan -out=main.tfplan`
6. Kjør `terraform apply "main.tfplan"`
7. Done!

![alt text](images\success.png)

For å slette det som kjører kan du kjøre `terraform destroy` og bekrefte med _yes_. 

![alt text](images\destroyed.png)