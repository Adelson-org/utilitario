Attribute VB_Name = "Module11"
Sub Adel()


Auxiliar.Rows.Delete



Dim lado As String
Dim linea As Integer
Dim linea2 As Integer
Dim subio As Boolean
Dim cuentaX As String
Dim inicia As String
Dim totalD As Double
Dim totalC As Double


linea = 0
linea2 = 0

For i = 4 To 50000
    If Cuenta.Cells(i, 2) = "" Then 'cuenta
        Exit For
    End If
        
    totalD = 0
    totalC = 0
    cuentaX = ""
    'si columna numero="" es una cuenta auxiliar
    If Cuenta.Cells(i, 1) = "" Then
        subio = False
        inicia = ""
        For j = 1 To 100000 ' diario
            If Diario.Cells(j, 1) = "" Then
                Exit For
            End If
        
            'capturo la natuzaleza de la cuenta desde el diario
            If UCase(Diario.Cells(j, 1)) = "CUENTA" Then
                lado = "debito"
            ElseIf UCase(Diario.Cells(j, 1)) = "@" Then
                lado = "credito"
            End If
            
            If UCase(Diario.Cells(j, 1)) = UCase(Cuenta.Cells(i, 2)) Then ' las cuentas coinciden?
                'inserta la cuenta, sino esta insertada ya
                If cuentaX <> UCase(Cuenta.Cells(i, 2)) Then
                   cuentaX = UCase(Cuenta.Cells(i, 2))
                   linea = linea + 1  ' cuenta
                   Auxiliar.Cells(linea, 1) = cuentaX
                   Auxiliar.Range("A" + CStr(linea) + ":D" + CStr(linea)).Merge
                   Auxiliar.Range("A" + CStr(linea) + ":D" + CStr(linea)).HorizontalAlignment = xlCenter
                   Auxiliar.Range("A" + CStr(linea) + ":D" + CStr(linea)).Font.Bold = True
                   Auxiliar.Range("A" + CStr(linea) + ":D" + CStr(linea)).Interior.ColorIndex = 37
                   linea = linea + 1 '   Debito  Credito
                   Auxiliar.Cells(linea, 2) = "Debito"
                   Auxiliar.Cells(linea, 3) = "Credito"
                End If
                             
                
                If inicia = "" Then
                    If lado = "debito" Then
                           inicia = "debito"
                    ElseIf lado = "credito" Then
                          inicia = "credito"
                    End If
                End If
                
                If inicia = "debito" Then
                
                            If lado = "debito" Then
                                If linea2 > linea Then
                                    linea = linea2
                                End If
                                linea = linea + 1
                                Auxiliar.Cells(linea, 1) = CStr((Diario.Cells(j, 6))) + ")"      'asiento
                                Auxiliar.Cells(linea, 2) = Diario.Cells(j, 3)    ' auxiliar
                                linea2 = linea
                                totalD = totalD + CDbl(Diario.Cells(j, 3))
                            ElseIf lado = "credito" Then
                                    'If subio = False Then
                                        While Auxiliar.Cells(linea, 3) = ""
                                            linea = linea - 1
                                        Wend
                                       ' subio = True
                                    'End If
            
                                    linea = linea + 1
                                    Auxiliar.Cells(linea, 3) = Diario.Cells(j, 3)    ' auxiliar
                                    Auxiliar.Cells(linea, 4) = "(" + CStr(Diario.Cells(j, 6))   'asiento
                                    totalC = totalC + CDbl(Diario.Cells(j, 3))
                             End If
                             
                ElseIf inicia = "credito" Then
                
                        If lado = "credito" Then
                            If linea2 > linea Then
                                    linea = linea2
                            End If
                            linea = linea + 1
                            Auxiliar.Cells(linea, 3) = Diario.Cells(j, 3)    ' auxiliar
                            Auxiliar.Cells(linea, 4) = "(" + CStr(Diario.Cells(j, 6))   'asiento
                            linea2 = linea
                            totalC = totalC + CDbl(Diario.Cells(j, 3))
                        ElseIf lado = "debito" Then
                                'If subio = False Then
                                    While Auxiliar.Cells(linea, 2) = ""
                                        linea = linea - 1
                                    Wend
                                   ' subio = True
                               ' End If
        
                               linea = linea + 1
                               Auxiliar.Cells(linea, 1) = CStr((Diario.Cells(j, 6))) + ")"      'asiento
                               Auxiliar.Cells(linea, 2) = Diario.Cells(j, 3)    ' auxiliar
                               totalD = totalD + CDbl(Diario.Cells(j, 3))
                         End If
                         
                End If
                
                
             End If
        Next j
            If linea2 > linea Then
                linea = linea2
                linea2 = 0
            End If
            linea = linea + 1
            If totalD > totalC Then
                Auxiliar.Cells(linea, 2) = CStr(totalD - totalC)
                Auxiliar.Range("B" + CStr(linea)).Font.Color = ColorConstants.vbRed
                
                Dim a As Integer
                For a = 4 To 500
                    If UCase(Cuenta.Cells(a, 2)) = cuentaX Then 'cuenta
                        Cuenta.Cells(a, 4) = totalD - totalC
                        Exit For
                    End If
                Next a
                
            Else
                Auxiliar.Cells(linea, 3) = CStr(totalC - totalD)
                Auxiliar.Range("C" + CStr(linea)).Font.Color = ColorConstants.vbRed
                
                Dim b As Integer
                For b = 4 To 500
                    If UCase(Cuenta.Cells(b, 2)) = cuentaX Then 'cuenta
                        Cuenta.Cells(b, 4) = totalC - totalD
                        Exit For
                    End If
                Next b
            End If
            
            
            
            linea = linea + 1
            
    End If
    
Next i



End Sub




