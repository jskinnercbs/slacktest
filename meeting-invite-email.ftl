${hostName} is inviting you to a  ${siteName} meeting.

MEETING ID : ${meetingNumber}
<#if password??>
PASSWORD : ${password}
</#if>

<b>JOIN ZOOM FROM A DEVICE</b>
${meetingUrl}

<#if enablePSTN>
<#assign phoneTapPwd = h323Password?? && enablePSTNPasswordProtected?? && !(isUserTSPEnabled??) >
<#if isUserTSPEnabled?? && isUserTSPEnabled>
Dial
<#if tspNumbersInfo?? && ((tspNumbersInfo?size) > 0)><#list tspNumbersInfo as tspNumberInfo>${tspNumberInfo}</#list></#if>
${(tspPsdTitle!'')?html}: ${(tspPsd!'')?html}
<#elseif  pickedNumbers?? && ((pickedNumbers?size) > 0)>
<#if supportOneTap?? && supportOneTap>
<b>JOIN BY PHONE NUMBER</b>
${pickedNumbers[0].displayNumber?replace(' ','')?replace('(0)','')},,${number?c}#<#if phoneTapPwd>,,,,*${h323Password}#</#if> ${pickedNumbers[0].countryName!'US'}<#if pickedNumbers[0].free> Toll-free</#if><#if ((pickedNumbers[0].cityName)?? && (pickedNumbers[0].cityName)?length gt 1)> (${pickedNumbers[0].cityName?html}<#if (pickedNumbers[0].labels)?? && (pickedNumbers[0].labels)?length gt 1>,${pickedNumbers[0].labels?html})<#else>)</#if><#else><#if (pickedNumbers[0].labels)?? && (pickedNumbers[0].labels)?length gt 1> (${pickedNumbers[0].labels?html})</#if></#if>
<#--  <#if ((pickedNumbers?size) > 1 && pickedNumbers[1].country == pickedNumbers[0].country)>
${pickedNumbers[1].displayNumber?replace(' ','')?replace('(0)','')},,${number?c}#<#if phoneTapPwd>,,,,*${h323Password}#</#if> ${pickedNumbers[0].countryName!'US'}<#if pickedNumbers[1].free> Toll-free</#if><#if ((pickedNumbers[1].cityName)?? && (pickedNumbers[1].cityName)?length gt 1)> (${pickedNumbers[1].cityName?html}<#if (pickedNumbers[1].labels)?? && (pickedNumbers[1].labels)?length gt 1>,${pickedNumbers[1].labels?html})<#else>)</#if><#else><#if (pickedNumbers[1].labels)?? && (pickedNumbers[1].labels)?length gt 1> (${pickedNumbers[1].labels?html})</#if></#if>
</#if>  -->
</#if>
<#if showInternationalNumbersLink?? && showInternationalNumbersLink>Find other local numbers: ${teleConferenceUrl}</#if>
<#--  Dial by your location
<#list pickedNumbers as pickedNumber>
${pickedNumber.displayNumber} <#if pickedNumber.free>${pickedNumber.countryName!'US'} Toll-free<#else>${pickedNumber.countryName!'US'}</#if><#if ((pickedNumber.cityName)?? && (pickedNumber.cityName)?length gt 1)> (${pickedNumber.cityName?html}<#if (pickedNumber.labels)?? && (pickedNumber.labels)?length gt 1>,${pickedNumber.labels?html})<#else>)</#if><#else><#if (pickedNumber.labels)?? && (pickedNumber.labels)?length gt 1> (${pickedNumber.labels?html})</#if></#if>
</#list>
Meeting ID: ${meetingNumber}  -->
<#else>
<#if supportOneTap?? && supportOneTap>
One tap mobile
${tollNumbers[0]?replace(' ','')?replace('(0)','')},,${number?c}#<#if phoneTapPwd>,,,,*${h323Password}#</#if> ${tollCountry!'US'} Toll
<#if ((tollNumbers?size) > 1)>
${tollNumbers[1]?replace(' ','')?replace('(0)','')},,${number?c}#<#if phoneTapPwd>,,,,*${h323Password}#</#if> ${tollCountry!'US'} Toll
</#if>
</#if>

Dial by your location
${tollNumbers[0]} ${tollCountry!'US'} Toll
<#if ((tollNumbers?size) > 1)>${tollNumbers[1]} ${tollCountry!'US'} Toll</#if>
<#if premiumNumbers?? && ((premiumNumbers?size) > 0)>
<#list premiumNumbers as pmNum>
${pmNum.displayNumber} ${pmNum.countryName!'US'} Toll
</#list>
</#if>
<#if tollFreeNumbers?? && ((tollFreeNumbers?size) > 0)>
<#list tollFreeNumbers as tfreeNum>
${tfreeNum} ${tollFreeCountrys[tfreeNum_index]!'US'} Toll-free
</#list>
</#if>
Meeting ID: ${meetingNumber}
</#if>
<#if h323Password?? && enablePSTNPasswordProtected?? && !(isUserTSPEnabled??)>
Passcode: ${h323Password}
</#if>
<#--  <#if showInternationalNumbersLink?? && showInternationalNumbersLink>Find your local number: ${teleConferenceUrl}</#if>  -->
<#elseif useOtherAudioConference>
Join by phone
${otherAudioConferenceInfo!''}
</#if>
<#if h323Gateway?? && ((h323Gateway?size) > 0)>

<b>JOIN ZOOM IN A CONFERENCE ROOM</b>
MEETING ID : ${meetingNumber}
<#if password??>
MEETING PASSWORD : ${password}
</#if>
HOSTS ONLY: 

<img width="50px" src="https://www.viacomcbs.com/sites/g/files/dxjhpe226/files/ViacomCBSDotCom/Others/Images/ViacomCBS_LOGO_Color.svg"/>
<ul>
<li><a href=#>Conference Room Guides</a></li>
<li><a href=#>Find your Host Key (SSO login)</a></li>
<li><a href=#>pITstop</a></li>
</ul>

<b>OTHER CONFERENCE ROOM CONNECTIONS</b>
<#if isCRC?? && isCRC>

Join by SIP
${number?c}${(sipDomain!'@zoomcrc.com')?html}
<#else>

Join by SIP
${number?c}@${h323Gateway[0]}
<#if ((h323Gateway?size) > 1)>
${number?c}@${h323Gateway[1]}
</#if>
</#if>

Join by H.323
<#list h323Gateway as rc>
${rc}
</#list>
Meeting ID: ${meetingNumber}
<#if h323Password??>
Passcode: ${h323Password}
</#if>
<#if shortSIPUrl??>
More H.323 IP addresses: ${shortSIPUrl}
</#if>
</#if>

<#if enableLync??>
Join by Skype for Business
${lyncUrl}
</#if>

<#if moreCustomizedContent??>
${moreCustomizedContent}
</#if>