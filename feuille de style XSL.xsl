<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé Bancaire</title>
                <style>
                    body { font-family: Arial; background-color: #f5f5f5; }
                    h1 { color: #003366; }
                    table { border-collapse: collapse; width: 80%; margin: 20px auto; }
                    th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
                    th { background-color: #003366; color: white; }
                    tfoot { font-weight: bold; background-color: #eee; }
                </style>
            </head>
            
            <body>
                <h1 align="center">Relevé Bancaire</h1>
                <p align="center">
                    <strong>RIB :</strong> <xsl:value-of select="releve/@RIB"/> <br/>
                    <strong>Date du relevé :</strong> <xsl:value-of select="releve/dateReleve"/> <br/>
                    <strong>Solde :</strong> <xsl:value-of select="releve/solde"/> DH
                </p>
                
                <table>
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant (DH)</th>
                        <th>Description</th>
                    </tr>
                    
                    <!-- Affichage des opérations -->
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                            <td><xsl:value-of select="@type"/></td>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                    
                    <!-- Totaux -->
                    <tfoot>
                        <tr>
                            <td colspan="2">Total CREDIT</td>
                            <td colspan="2">
                                <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> DH
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">Total DEBIT</td>
                            <td colspan="2">
                                <xsl:value-of select="sum(releve/operations/operation[@type='DEBIT']/@montant)"/> DH
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
