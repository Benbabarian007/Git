
Add-Type -AssemblyName System.Windows.Forms


$form = New-Object System.Windows.Forms.Form
$form.Text = "Schere, Stein, Papier, Echse, Spock"
$form.Size = New-Object System.Drawing.Size(1400,600)

$choices = ("Schere","Papier","Stein","Echse","Spock")
$spieler = $null
$dämon = $null
$Valideauswahl = 0
$Ergebnis = $null



function Invoke-ChoiceButton {
    $buttonSchere = New-Object System.Windows.Forms.Button
    $buttonSchere.Text = "Schere"
    $buttonSchere.Location = New-Object System.Drawing.Point(200, 300)
    $buttonSchere.Add_Click({$spieler = "Schere" ; Invoke-Knopfräumer $label; Invoke-EndScreen $(Invoke-Siegerbestimmung)})
    
    $buttonStein = New-Object System.Windows.Forms.Button
    $buttonStein.Text = "Stein"
    $buttonStein.Location = New-Object System.Drawing.Point(400, 300)
    $buttonStein.Add_Click({$spieler = "Stein"; $erg = Invoke-Siegerbestimmung ; Invoke-Knopfräumer ; Invoke-EndScreen $erg})

    $buttonPapier= New-Object System.Windows.Forms.Button
    $buttonPapier.Text = "Papier"
    $buttonPapier.Location = New-Object System.Drawing.Point(600, 300)
    $buttonPapier.Add_Click({$spieler = "Papier"; Invoke-Knopfräumer ; Invoke-EndScreen $(Invoke-Siegerbestimmung)})

    $buttonEchse = New-Object System.Windows.Forms.Button
    $buttonEchse.Text = "Echse"
    $buttonEchse.Location = New-Object System.Drawing.Point(800, 300)
    $buttonEchse.Add_Click({$spieler = "Echse"; Invoke-Knopfräumer ; Invoke-EndScreen $(Invoke-Siegerbestimmung)})

    $buttonSpock = New-Object System.Windows.Forms.Button
    $buttonSpock.Text = "Spock"
    $buttonSpock.Location = New-Object System.Drawing.Point(1000, 300)
    $buttonSpock.Add_Click({$spieler = "Spock"; Invoke-Knopfräumer ; Invoke-EndScreen $(Invoke-Siegerbestimmung)})

    $form.Controls.Add($buttonSchere)
    $form.Controls.Add($buttonStein)
    $form.Controls.Add($buttonPapier)
    $form.Controls.Add($buttonEchse)
    $form.Controls.Add($buttonSpock)

}





function Invoke-Siegerbestimmung {
    #param ($spieler, $dämon, $Ergebnis)
    if (($spieler -eq "Schere" -and $dämon -eq "Papier") -or ($spieler -eq "Schere" -and $dämon -eq "Echse") `
    -or ($spieler -eq "Stein" -and $dämon -eq "Schere") -or ($spieler -eq "Spock" -and $dämon -eq "Stein")`
    -or ($spieler -eq "Stein" -and $dämon -eq "Echse") -or ($spieler -eq "Papier" -and $dämon -eq "Stein")`
    -or ($spieler -eq "Papier" -and $dämon -eq "Spock") -or ($spieler -eq "Echse" -and $dämon -eq "Spock")`
    -or ($spieler -eq "Echse" -and $dämon -eq "Papier") -or ($spieler -eq "Spock" -and $dämon -eq "Schere")) {
        #dinge passieren
        $Ergebnis = 1
    } 
    else {$Ergebnis = 0}
    Write-Host $dämon
    Write-Host $spieler
    write-host $Ergebnis
  return $Ergebnis
}

function Invoke-EndScreen {
    
    param ($Ergebnis)
    if ($Ergebnis -eq 1)
    {$label.Text = 
    "Ich wählte $spieler – und der Dämon, in einem seltenen Moment der Verwirrung, zeigte... $dämon ? 
    Sein Blick wanderte ungläubig zwischen meiner Hand und seiner eigenen hin und her. 
    ``Was... wie...? Nein! Das ist nicht möglich!`` 
    Er fiel theatralisch zu Boden, die Hände dramatisch über den Kopf geworfen.``Du hast gewonnen...``, 
    seufzte er schließlich, ``aber nur, weil ich einen schlechten Tag habe.`` 
    Er stand auf und schüttelte frustriert den Kopf. ``Na schön, deine Seele bleibt vorerst bei dir. Und die Jacke... die war sowieso nicht mal aus echtem Leder!`` Mit einem lauten puff verschwand er, während er im Abgang noch brummte: ``Ich hasse Schere, Stein, Papier...``"
    }
    if ($Ergebnis -eq 0) {
        $label.Text = 
        "Mit zittrigen Händen wählte ich $spieler, während der Dämon genüsslich $dämon zeigte. Ein breites, siegessicheres Grinsen zog sich über sein Gesicht. 
        ``Ha! Papier schlägt Stein!``, 
        rief er triumphierend, während er begann, ein absurdes Tanzritual aufzuführen, das offenbar die Dämonenversion eines Siegestanzes war.``Na dann``, 
        meinte er mit einem Achselzucken: 
        ``deine Seele gehört jetzt mir... und die Jacke deines Ururururgroßvaters übrigens auch.`` 
        Mit einem dramatischen Schnipsen verschwand ich in einer Wolke aus rotem Rauch – doch bevor alles schwarz wurde, hörte ich noch die kratzige Stimme des Dämons: 
        ´´Hoffentlich stehst du auf ewiges Toiletten putzen. 
        Dämonen brauchen dringend mehr Reinigungskräfte!´´"
    }
    return $label
}

function Invoke-Knopfräumer {
    param ($form, $buttonEchse, $buttonSpock, $buttonPapier, $buttonStein, $buttonSchere, $label)
    $form.Controls.Remove($buttonSchere) 
    $form.Controls.Remove($buttonStein)
    $form.Controls.Remove($buttonPapier)
    $form.Controls.Remove($buttonSpock)
    $form.Controls.Remove($buttonEchse)
    Write-Host = "Knöpfe müssen weg"
    return $form, $buttonEchse, $buttonSpock, $buttonPapier, $buttonStein, $buttonSchere, $label
}


#nachdem $Spieler vergeben würde 
#Ergebnis bestimmung
#soll das Label das Ergebnis anzeigen
#zurück zum start?




$label = New-Object System.Windows.Forms.Label
$label.Text = "Der Alltag war noch nie besonders spannend, aber heute schien eine neue Dimension des Grauens und der Absurdität den monotonen Rhythmus zu stören. 
Plötzlich erschien er, der Dämon, ein finsterer Schatten, der die Kälte der Hölle mit sich brachte und die Luft mit einem schaurigen Flüstern erfüllte. 
Mit einem gleißenden Funkeln in seinen blutroten Augen ergriff er mich, und bevor ich mich versah, fand ich mich in einem düsteren, bizarren Raum wieder, der von rätselhaften Symbolen und unheilvollen Relikten gesäumt war.
``Deine Seele``, knurrte der Dämon mit einer Stimme, die wie das Knirschen von Knochen klang,``ist seit Generationen verpfändet worden. 
Dein Urururururgroßvater hat sie gegen eine neue Jacke eingetauscht`` Ein Hauch von Spott lag in seinen Worten. ``Nun wirst du sie in einem Spiel gewinnen oder verlieren. 
Die Regeln sind einfach: Schere, Stein, Papier, Echse, Spock. 
Schere schneidet Papier         
Papier bedeckt Stein                
Stein zerquetscht Echse
Echse vergiftet Spock
Spock zertrümmert Schere
Schere köpft Echse
Echse frisst Papier
Papier widerlegt Spock
Spock verdampft Stein
Stein schleift Schere``
Mit einem teuflischen Lächeln stellte er einen Tisch vor uns auf, der in einer schaurigen Beleuchtung schimmerte. 
Auf diesem Tisch lagen die Schicksale, und der Dämon war bereit, in einem Spiel von schicksalhafter Bedeutung um meine Seele zu kämpfen."
$label.AutoSize = $true
$label.Location = New-Object System.Drawing.Point(50, 50)
$form.Controls.Add($label)
$dämon = "Schere","Papier","Stein","Echse","Spock" | Get-Random

        $button = New-Object System.Windows.Forms.Button
        $button.Text = "Weiter"
        $button.Location =  New-Object System.Drawing.Point(600, 500)
        $button.Add_Click({

            write-host $dämon

            $label.Text = "Wähle nun weise: ``Schere, Stein, Papier, Echse, Spock`` sprach der Dämon"  

            $form.Controls.Remove($button)

            Invoke-ChoiceButton $form
        })
    

$form.Controls.Add($button)


$form.ShowDialog()

