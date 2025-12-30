<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    
    <xsl:template match="/">
        <html>
            <head>
                <title>Relevé Bancaire - Opérations CREDIT</title>
                <style>
                    body { font-family: Arial; background-color: #f0f8ff; }
                    h1 { color: #006600; }
                    table { border-collapse: collapse; width: 70%; margin: 20px auto; }
                    th, td { border: 1px solid #aaa; padding: 8px; text-align: center; }
                    th { background-color: #006600; color: white; }
                    tfoot { font-weight: bold; background-color: #e0e0e0; }
                </style>
            </head>
            
            <body>
                <h1 align="center">Opérations de type CREDIT</h1>
                <p align="center">
                    <strong>RIB :</strong> <xsl:value-of select="releve/@RIB"/>
                    — <strong>Date Relevé :</strong> <xsl:value-of select="releve/dateReleve"/>
                </p>
                
                <table>
                    <tr>
                        <th>Date</th>
                        <th>Montant (DH)</th>
                        <th>Description</th>
                    </tr>
                    
                    <!-- Sélection uniquement des opérations CREDIT -->
                    <xsl:for-each select="releve/operations/operation[@type='CREDIT']">
                        <tr>
                            <td><xsl:value-of select="@date"/></td>
                            <td><xsl:value-of select="@montant"/></td>
                            <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                    
                    <tfoot>
                        <tr>
                            <td>Total CREDIT</td>
                            <td colspan="2">
                                <xsl:value-of select="sum(releve/operations/operation[@type='CREDIT']/@montant)"/> DH
                            </td>
                        </tr>
                    </tfoot>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>
