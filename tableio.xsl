<?xml version = "1.0" ?>
<xsl:stylesheet version = "1.0" xmlns:xsl = "http://www.w3.org/1999/XSL/Transform">
	<xsl:template match = "/">
   		<html>	
   		<head>
		   	<style type='text/css'>
				td {  font-family: verdana; font-size:11; color: #000000}
				p { margin-top:30px; margin-left:50px }
   			</style>
		</head>
   		<body bgcolor="white">
   		<p>
   				<table width="649" border="0">
   				<tr>
   					<td align="center"><font size="4">I/O Definition Document</font></td>
   					</tr>
   				</table>
   				<br></br>
   			<xsl:apply-templates select="request"/>
		</p>
		</body>   			
   		</html>
	</xsl:template>
	
	<xsl:template match="request">
		<table width="649" border="0" bordercolor="#000000" cellspacing="1" cellpadding="3" bgcolor="#ffbbcc">
			<tr>
				<td colspan="4" bgcolor="#ffbbcc" ><font COLOR="ffffff"><b>Request Information</b></font></td>
			</tr>
		</table>
		<table width="649" border="0" bordercolor="#bbbbbb" cellspacing="1" cellpadding="3" bgcolor="#bbbbbb">
			<tr>
				<td bgcolor="#bbbbbb" width="120"><font COLOR="ffffff"><b>Name</b></font></td>
				<td bgcolor="#ffffff" width="120"><xsl:value-of select="@Name" /></td>
				<td bgcolor="#bbbbbb" width="120"><font COLOR="ffffff"><b>Descript</b></font></td>
				<td bgcolor="#ffffff"><xsl:value-of select="@descript" /></td>
			</tr>
		</table>
		<br></br>
		<table width="649" border="0" bordercolor="#bbbbbb" cellspacing="1" cellpadding="3" bgcolor="#ffbbcc">
   			<tr bgcolor="#ffbbcc">
   				<td colspan="5"><font color="white"><b>Input</b></font> </td>
   			</tr>
   		</table>		
		<xsl:apply-templates select="input"/>

		<table width="649" border="0" bordercolor="#bbbbbb" cellspacing="1" cellpadding="3" bgcolor="#ffbbcc">
			<tr bgcolor="#ffbbcc">
				<td colspan="5"><font color="white"><b>Output</b></font> </td>
			</tr>
		</table>
		<xsl:apply-templates select="output"/>
   		
   		<table border='0' width = "649">
	   		<tr>
	   			<td height="2" align="center"> 
	            	<font size="2" color="#bbbbbb"><a>Copyright(c) cherryjo.kr@gmail.com all rights resversed.</a></font>
	            </td>
	         </tr>
         </table>
	</xsl:template>

	<xsl:template match="input">
   		<xsl:apply-templates select="record"/>

   	</xsl:template>

	<xsl:template match="output">
		<xsl:apply-templates select="record"/>

	</xsl:template>
	
	
	<xsl:template match="record">
		<table width="649" border="0" bordercolor="#bbbbbb" cellspacing="1" cellpadding="3" bgcolor="#bbbbbb">
  			<tr bgcolor="#bbbbbb">
   				<td><font color="white"><b>Name</b></font> </td>
   				<td><font color="white"><b>Single/Multi</b></font> </td>
   				<td><font color="white"><b>Size Type</b></font> </td>
   				<td><font color="white"><b>Size</b></font> </td>
   				<td><font color="white"><b>Size Field</b></font> </td>  				
   				<td><font color="white"><b></b></font> </td>  				
   				<td><font color="white"><b></b></font> </td>  				
   			</tr>	
		<tr bgcolor="#ffffff">
			<td><xsl:value-of select="@name" /></td>
			<td>
				<xsl:if test = "@type = 1">Single Record</xsl:if>
				<xsl:if test = "@type = 0">Multiple Record</xsl:if>
			</td>
			<td>
				<xsl:if test = "@sizetype = 0">don't care</xsl:if>
				<xsl:if test = "@sizetype = 1">field</xsl:if>
				<xsl:if test = "@sizetype = 2">fixed</xsl:if>
				<xsl:if test = "@sizetype = 3">unti eof</xsl:if>				
			</td>
			<td align="right"><xsl:value-of select="@size" /></td>
			<td><xsl:value-of select="@sizefield" /></td>
			<td></td>
			<td></td>
		</tr>

		<tr bgcolor="#bbbbbb">
			<td><font color="white"><b>bind</b></font> </td>
			<td width="90"><font color="white"><b>name</b></font> </td>
			<td><font color="white"><b>type</b></font> </td>
			<td><font color="white"><b>len</b></font> </td>
			<td><font color="white"><b>format</b></font> </td>			
			<td><font color="white"><b>const</b></font> </td>			
			<td><font color="white"><b>desc</b></font> </td>			
		</tr>

		<xsl:for-each select="*">
			<xsl:choose>
				<xsl:when test="name()= 'field'">
					<tr bgcolor="#ffffff">
						<td width="120"><xsl:value-of select="@bindname" /></td>
						<td width="90"><xsl:value-of select="@name" /></td>
						<td width="60">
						<xsl:if test = "@type = 1">string</xsl:if>
						<xsl:if test = "@type = 2">long</xsl:if>
						<xsl:if test = "@type = 3">unsigned long</xsl:if>
						<xsl:if test = "@type = 4">short</xsl:if>
						<xsl:if test = "@type = 5">unsigned short</xsl:if>
						<xsl:if test = "@type = 6">float</xsl:if>
						<xsl:if test = "@type = 7">double</xsl:if>
						<xsl:if test = "@type = 8">char</xsl:if>
						<xsl:if test = "@type = 9">unsigned chrr</xsl:if>						
						</td>
						<td width="40" align="right"><xsl:value-of select="@size" /></td>
						<td><xsl:value-of select="@fieldformat" /></td>
						<td><xsl:value-of select="@constvalue" /></td>
						<td><xsl:value-of select="@desc" /></td>
					</tr>
				</xsl:when>			
				<xsl:otherwise>
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
		</table>
		<br></br>
	</xsl:template>
	
	
</xsl:stylesheet>