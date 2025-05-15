Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9444421FF5D
	for <workflows@vger.kernel.org>; Thu, 15 May 2025 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747326815; cv=none; b=GPqmZ6k3Py9l6OUmrODZR3Zv+eEqv4rzbU+5pXOUup8G/8D7cLrFmlsGR+vYyN/894jtUxRbyNa3/SF+cuMxmD9kWSTxr9HRLU0AZLkrtueMIdU91ZP2grZO2gFWm0T984nWHDOSf+9khj5dq0WRAhQ3lhKZEmlLffbIzPnlE6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747326815; c=relaxed/simple;
	bh=vfsPo6kqmoyc6t4RDCZRubbTIjpZOLVaBI3BRmArROw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WDKDWVUUNMx9LkPVnfoSPT6x5V40t+olaZBaoqwzfbgAcfB78hWnOaO8I4Ryi5adQaCPPSGHnncxe2HPVs8dCDwRoeyePhhS9QvqcyG80nxaOVbCQ1S/BDDp1dy30LB52g7uDVSgwozVX9+HbPvgGSsdiPc/NbBiiGz60+Az4XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U3IkSFIw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U3IkSFIw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFYmj031713
	for <workflows@vger.kernel.org>; Thu, 15 May 2025 16:33:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	862jGz73qlWJ7n8nlKWUcwMkWwMBWWvd7YMchYZdOp4=; b=U3IkSFIwni0+8jPw
	3kt9k1RvvxZOnwblZ42CI0zG/ean0/BUNKo6oo0xYcDCo250o9aMOROr2TJipmMu
	K4KwVQ9qOg54gY6rrBrTmkygLc+dNdoQ/nUftCRmVGgiS1L3Hu0wgCP+5rE3Lr0L
	jDdJYpiGG1n0EY6T34cYOKbfTRVSoi/G4BuVxScyyWoUEPpvPfkXqLhEeulK0pDA
	cfMIvnD2GToP0C7bQTtY4fR2foyMlborZkvoTUMZ+iEti39qVRBm08ZMvgE+EyTb
	7zYOfEwGK0LMS3GCuZZmMqtOiAGjPjP2tPN/2YXNA8msdkIZzNKSNFQ4KW2Hhz2p
	hJdEfA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcr6rf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <workflows@vger.kernel.org>; Thu, 15 May 2025 16:33:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22e3abea7e8so13488985ad.2
        for <workflows@vger.kernel.org>; Thu, 15 May 2025 09:33:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747326811; x=1747931611;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=862jGz73qlWJ7n8nlKWUcwMkWwMBWWvd7YMchYZdOp4=;
        b=HikXEHjG7oMWUew8HRnjTJPDdjd2Zx2Sj+E8aWZAX8thrNoC8lPbgRi3pcJMLJ1DW8
         41LkWtxtL8blzH2dx9vGDteihIbFEynfsteABOvLcf4U+o0m87tj9VNJVnDNvPzktjsv
         OnXDKjC13OOHCeUg57C0tCnM8E39vIzMNSUj/YclPkbS8Hs/qHJVoHwjyvmM6jf+xYTY
         Ooyz2cOD2nEfIqYoydcn3bX400zdvifnEE6DorK4CEWjvQyCtJKBPtfgmTXRiy1i8J2f
         Cufkhc68k++jqZ7w3QSRheO6rFM0Avt4VFvb+NU8zZtmWWyFvQkCFembdWaAfTBR1kab
         pecg==
X-Forwarded-Encrypted: i=1; AJvYcCVI0HJTPaIm4oITZWyqff/0F2+azWpaZDpFISmKXrJ6/84fDfsYbdPRSnaulKBtH/R2puFM88WjrpM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHdBwBB/5pVyqnufNbSxGcoktKI0nqzzf5hdYeOq0Jwh3WyfHP
	xG+T4e2J0iIPQR+c9ArIOeyAfwMueDEW6eLQOjfgMSWhCg92xVpWTThyB3D0eznLbHtvn6fWW0T
	QzrCXwJMg2FXCcxXLxbuq+iOlidy9X0X9xxq42K4H5W8wEvORqJ6rg8Hzf9xLUb8=
X-Gm-Gg: ASbGnctWDYjP/gOis6F5UcWw8WGnRObJxGLGXfMEHkZo+Gq3syFw8XOTcsD4eWM/TYS
	jras9t4nV5Xz2FZ55lHEQb5GLqX+F4PGiBAjZNI8LV1yUwPIrTkrT+oTFWIHJCGqFQc+XGMrYah
	YOuokIBMWrdspiOIKeRTCzX8/ZPwUiHzr0v65xbHtftbuoxIeCGs9XExyAWdv9BiTu9K5WpfFNt
	ronK6GfZ58TDvEqR2pauv4c7fHrGL7xiZrBc+j1J+pC0E3ct4I+LIMSV3ZA8UaJ8EmYUeeCdzFL
	H8PzMhEVG+EPJ0fV/Vo/AV8Cmju/s8WlvNXzTw/pS88/1wkX/DkIJwmylhYM7+ZDJ88=
X-Received: by 2002:a17:903:2ece:b0:223:432b:593d with SMTP id d9443c01a7336-231d4599a7amr1470055ad.42.1747326810617;
        Thu, 15 May 2025 09:33:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4winHiJbc+0IhMnMet2XZCLQUA+UOfrUcc7trJErFRppvnj05B0//ijXWpNHLurqvAGyknA==
X-Received: by 2002:a17:903:2ece:b0:223:432b:593d with SMTP id d9443c01a7336-231d4599a7amr1469915ad.42.1747326810095;
        Thu, 15 May 2025 09:33:30 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231c38d2fb4sm10421385ad.228.2025.05.15.09.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 09:33:29 -0700 (PDT)
Message-ID: <2b0a1115-b75f-491b-b2e3-85b6f433b9d9@oss.qualcomm.com>
Date: Thu, 15 May 2025 09:33:28 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] CodingStyle: flip the rule about curlies
To: Alexey Dobriyan <adobriyan@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250509203430.3448-1-adobriyan@gmail.com>
 <20250509203430.3448-9-adobriyan@gmail.com>
 <2025051001-undertow-unsolved-3aee@gregkh>
 <433d5f82-3ca9-40b8-82e8-acd647f55d67@oss.qualcomm.com>
 <2025051204-runt-mobility-6fbc@gregkh>
 <d21af9bc-baec-4b13-b0e0-d02829822682@p183>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d21af9bc-baec-4b13-b0e0-d02829822682@p183>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aeLqsSl-WlNYFKM67zB6-bcdFJYqQUrd
X-Authority-Analysis: v=2.4 cv=Auju3P9P c=1 sm=1 tr=0 ts=6826175c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=nLmYZ6Dm7FMJzT2TopcA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: aeLqsSl-WlNYFKM67zB6-bcdFJYqQUrd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE2NCBTYWx0ZWRfX5FwQMzrLuGvW
 W+7JnesQEtrN/DphFfIxmg+Q+nxxFKY1HBrpSajH97rAsT2Fyk7RCfuyqzZ4A7IL6mxHo+WzAed
 +kGxAYy2qyXetnGTdUP6X85l+zc/R+SJzvCsa0C9zGgs04sbU6W56ncxYBdQiExW7J2yKnL1z07
 09fDeNLIzkHq6hnu0bXB5J4SmNd0Lm9Wb/DbAatSE8LZcPqTf973aHgNhXuvih0j+MIxPTHn6kx
 RUKb29A3tKV14CRGvJ9XM63A28XANQXo6u7XCafc5iQkzY4+HMznKkOfMMseJnO7Tfe3iP966Sb
 K/1WuKxGUdcErGdus4BmWV8NdrZ67if0dO01MtO46tdNc6gaShoHNvYy0tMspF8dR1g/h0srkWO
 GY5TETUxsdO+H7swn9S7MHvLLwNDCL+H9zb+UZEtyNFPd4Wlr3lxSWltH3XEtFiLpnt/JMfQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_07,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 adultscore=0 priorityscore=1501 mlxlogscore=686
 phishscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505150164

On 5/13/2025 12:06 PM, Alexey Dobriyan wrote:
> On Mon, May 12, 2025 at 06:56:56PM +0200, Greg KH wrote:
>> On Mon, May 12, 2025 at 09:43:10AM -0700, Jeff Johnson wrote:
>>> On 5/9/2025 11:18 PM, Greg KH wrote:
>>>> On Fri, May 09, 2025 at 11:34:30PM +0300, Alexey Dobriyan wrote:
>>>>> Require set of curlies {} in all if/else branches and all loops
>>>>> not matter how simple.
>>>>
>>>> Sorry, but no, we are not going to change this long-term coding style
>>>> rule for no real reason at this point in time.
>>>
>>> Is the infamous Apple SSL bug (CVE-2014-1266) a good reason?
> 
> Indeed.
> 
> Thanks, curlies were inspired by this CVE but I forgot to mention it.
> 
>> One bug in 2014 will require us to touch 30+ million lines of code?
> 
> Nobody is proposing to reformat 30 mil lines at one commit
> (as much as I'd like it).
> 
> Old code will stay old, new code will be formatted per new rules.
> 
>> Please be reasonable.
> 
> I'm very reasonable. Each patch details rationale why specific style is
> better.
> 
>> And everyone, remember _why_ we have a coding style.  It's not so much
>> the specifics of _what_ the coding style is,
> 
> What? When was the last time you read it? It is very much about specifics:
> 8 spaces, opening curly on the same line except at function scope,
> 80 columns, recent rule about to format function attributes.
> 
> It could have even more specific if there is pre-commit hook forcing
> formatting like commercial companies do.
> 
>> one at all.  Don't argue the specifics of the coding style without a
>> really really good reason why, with real details and proof.
> 
> What is "really really good"?
> 
> How do you know when it is good reason or not?
> 
> I think I have good reason: I programmed a little in another languages
> where some of the rules don't apply. In particular C++/Rust don't have
> a rule about declaring variables upfront. Nor does any popular programming
> language designed in the last 35 years (?).
> 
> Such experience made me realize that linux-kernel CodingStyle in this
> regard is pointless at best and counter-productive. It was so obvious.
> 
>> It took us a long time to increase the default line length, and that too
>> is still argued about for very good and valid reasons.
> 
> It still 80 columns in CodingStyle.
> 
>> That was discussed in detail, not just thrown at us like this patch series was.
> 
> Oh come on. In Russia we say "not my first year of marriage".
> 
> One of the unwritten rules of linux-kernel is to NEVER post [RFC]
> as it will be ignored, but to post a [PATCH] and Cc specific people
> to force a discussion.
> 
> I don't want to look like a thief who sneaks in occasional declaration
> in the middle of a function or set of curlies and get yelled by compilers
> or maintainers (especially those armed with checkpatch.pl).
> 
> I'll codify this first in CodingStyle, then delete relevant checks from
> checkpatch.pl (citing CodingStyle of course).

I replied only this patch in the series because, when I first started
programming using the Linux Coding Style in 2004, the single statement brace
rule was the only rule I disagreed with. And that was in part due to the fact
that, at three of my previous employers, the C coding style had dictated
mandatory use of braces. So the explicit prohibition of braces for single
statement conditionals really surprised me.

And note the rule, as written, is not what actually seems to be enforced (at
least by checkpatch.pl). What seems to be enforced is to not use braces where
the conditional is a single line and there is a single line statement. In
other words, if either the conditional or the single statement span multiple
lines, then braces are allowed (or encouraged?). As examples, checkpatch.pl
does not complain about any of the following (either to recommend adding
braces or removing braces):

	if (a_really_long_line_function_name(a_really_long_identifier) ||
	    another_really_long_function_name(another_long_identifier)) {
		braced();
	}

	if (a_really_long_line_function_name(a_really_long_identifier) ||
	    another_really_long_function_name(another_long_identifier))
		not_braced();

	if (a)
		call_a_really_long_function(with_long_argument,
					    another_log_argument);

	if (a) {
		call_a_really_long_function(with_long_argument,
					    another_log_argument);
	}

I'll also note that the popular style guide published by Michael Barr as well
as the MISRA C standard also dictate braces (but I'll admit that both of these
have other rules which contradict the Linux style and where I agree with the
Linux style).

All of that said, ultimately, the Coding Style is supposed to be enforce
consistent style that is readable and maintainable. I get that. I personally
believe that requiring braces makes the code more maintainable, and doesn't
detract from readability. However I'm also agree that changing the rule would
need to eventually lead to changing all the code that doesn't conform (since
one of the reasons for having a style is to have consistency), so I'm also
swayed by admonition to not "argue the specifics of the coding style without a
really really good reason why, with real details and proof," so I'll let
others have their say.

/jeff

