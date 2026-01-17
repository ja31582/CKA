jak przypisapoda do noda (k8s nie ma tego robić automatycznie)
![alt text](image.png)

etcd przchowuje informacje o tym jakie zasoby (pody) są na danym nodzie klastra, scheduler zbiera te informacje i umożliwia uruchomieneie poda na nodzie, który jest najmniej obciążony.

# nodeName
`nodeName: k8s-worker1` przypisujesz poda do konkretnego noda - na sztywno, bez wzdlęd na to czy nod ma wystarczającz zasoby, omija scheduling.
 używaj tylko przy statycznej nazwie nodów (inaczej pod nie uruchomi sie po restarcie noda - dynamiczne przydzielane nazw w eks).

# nodeSelector
 `k label nodes k8s-worker1 type=cpu` pozwala nadać label na działającym organiźmie.

```bash
 nodeSelector:
     type: cpu
```     
`nodeSelector` umożliwia przypisane poda, deploymentu do nodów zawierających odpowiedni label. możesz użyć kokretnego regionu lub AZ dla deploymentu poda.

# nodeAffinity
`nodeAffinity` jest bardziej elastyczny dla tworzenia poda ale za to bardziej skomplikowany dla tworzenia manifestu.
Daje możliwość definiowania wielu ról, wyrażeń

![alt text](image-3.png)

w przypadku 'requiredDuringShedukkung.nodeSelectorTerms.operator' istnieje kilka opcji: in, Not In, Exists, DoesNotExist Gt, Lt

|operator|opis|
|-----|----|
|In      |The label value is present in the supplied set of strings|
|NotIn	|The label value is not contained in the supplied set of strings|
|Exists  |A label with this key exists on the object|
|DoesNotExist|	No label with this key exists on the object|
|Gt  |The field value will be parsed as an integer, and that integer is less than the integer that results from parsing the value of a label named by this selector|
|Lt  |The field value will be parsed as an integer, and that integer is greater than the integer that results from parsing the value of a label named by this selector|

możemy wskazać na jakich nodach pody ie powinny się uruchomić.

![alt text](image-4.png)

nodeName
nodeSelector
nodeAffinity
podeAffinity
