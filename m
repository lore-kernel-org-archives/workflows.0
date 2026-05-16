Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD8C3E3DA1;
	Sat, 16 May 2026 15:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778945344; cv=none; b=X/UvdYkc03djBnl48YPY8yCpqFG9rYXIH2jy77UmPOO1ySBGZ8MeucMyfail4acXpWrfarodW6weyOKfLoCFXbi9UkFF4idAKkOoaa8U+Xo8MKIZmPNClmxqf3D5WDRrwfQ7PZ5tMGz8W31QCjYwqPGjYtiiwRQfEEpINEO5nyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778945344; c=relaxed/simple;
	bh=Y3WuhnHu7QPmVg+ykLOwTgydBzjCSDuS70FvLN3Xglg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MJ3Bk48rh36Q7J8o8ddSK//Z3xbH0jsZlrcEgxgv8H2THUEQn/dgjqTjmY47U8pme7YMCDrZ712r9EmrnYz57I9Z7E7JmlDt7zq3LjQMATGKbipx9gq94o9213lfYHCZz3wcxxEjHGgaYcfLBbF9pkqZupbWksm0xV+bPn3D3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=TDoPq+0B; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="TDoPq+0B"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G4CHnP787840;
	Sat, 16 May 2026 15:28:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=IZ5zA3XsTWGgAiQK890akjbBXwL2El
	lxVxpRn2y4q8Y=; b=TDoPq+0BCrQ9mf/TMuvfj5T4rSJL3BEMendO35UG4GE/jC
	lSFF5h5ZLmpl6YSUG9qvP68K5Us//Naxq4jDqBHgBL9tna5oyQgCN5Lhb60cY88H
	HkWOHdzv8YJnZW0F1v3tVf+e4pI78shua8qm6IhGkc4kbDd5Z/cn7pQoR4ICS8+o
	Usf3tuHt+OL8SV22SaILST3G9nUFmi6b1ufu01W2Ytx1eBAS45gnWi3XpwfSzz5F
	fjGvlfT01Frn5idZY7h3cKo5fpVvp/JpA3WwGlC9UBxypvoda+If5Drl0FRNH2CT
	//Y2Q76NU37Eq0oxsklFiJhwJ9vXw3QTRfdiwI5w==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e6hb81a4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 May 2026 15:28:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64GFO6Ri015810;
	Sat, 16 May 2026 15:28:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4e5kvcr80s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 May 2026 15:28:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64GFSLUP37683472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 16 May 2026 15:28:22 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBB4D20043;
	Sat, 16 May 2026 15:28:21 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F5B520040;
	Sat, 16 May 2026 15:28:21 +0000 (GMT)
Received: from osiris (unknown [9.87.148.37])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 16 May 2026 15:28:20 +0000 (GMT)
Date: Sat, 16 May 2026 17:28:19 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Kees Cook <kees@kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        David Laight <david.laight.linux@gmail.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Jani Nikula <jani.nikula@intel.com>,
        "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
Message-ID: <20260516152819.14597A76-hca@linux.ibm.com>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
 <20260514162652.107714-2-manuelebner@mailbox.org>
 <202605140931.913048A68B@keescook>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202605140931.913048A68B@keescook>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE1MCBTYWx0ZWRfX0vIa8fNIub+a
 vEjD0tmEgSUybvhsoEqpZ+V7J2x5KATmufeoCUEmL/3RZQkbrPWb0nLYo/jqvxjBgorE5D2e2mG
 GhaUPDFZ665Wfk33qP4tF9M1t9VgDCPOlnLQ66PTacCavUfw9aHRWFVoMoBndDPr67s58KlBZpx
 xpRwINo5+QQ7XZLWfXIIA7Vt86lZD2udfw3xcQEv6p7jY4X72oVbuWxw2PlEbY3Y/H64vjk5MPX
 DoYGjg0640rm5ULiUO/mlTqxXE0i76tFhG/XN9Ud/olTDItH0keStDRkM0ZjvX/WmidhsMhRsSC
 VEBvLCGWf+YX/g5I01MH4lK+ezIFgkI2Nav0Knp61EF3dhjCGAh501Sk6prWIcFakLYl9ir4auL
 aOzdwBhZqGvQZMlxRQAl02V2nMSGUCN3EX/dsqjMuJK9zWereJodGsE3fVkMQdxXdYIl/rA0Cer
 H+aaO1PHIgepunSrcNA==
X-Proofpoint-GUID: CS_nslXN3hW6X0meCFcdylojT7DcHbli
X-Proofpoint-ORIG-GUID: ak1NJ0RZPhuFZ_HqDcxEheQywVEf2ISA
X-Authority-Analysis: v=2.4 cv=aYBRWxot c=1 sm=1 tr=0 ts=6a088d18 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=b3CbU_ItAAAA:8
 a=6hv-k8JefT9e1lRrFzwA:9 a=CjuIK1q_8ugA:10 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605160150

On Thu, May 14, 2026 at 09:31:46AM -0700, Kees Cook wrote:
> On Thu, May 14, 2026 at 06:26:53PM +0200, Manuel Ebner wrote:
> > add strlcat and alternatives
> > 
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > ---
> >  Documentation/process/deprecated.rst | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > index fed56864d036..06e802f4bbfd 100644
> > --- a/Documentation/process/deprecated.rst
> > +++ b/Documentation/process/deprecated.rst
> > @@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
> >  attribute to avoid future compiler warnings. For cases still needing
> >  NUL-padding, strtomem_pad() can be used.
> >  
> > +strlcat()
> > +---------
> > +strlcat() must re-scan the destination string from the beginning on each
> > +call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
> > +snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
> > +of the arguments needs to be taken care off.
> > +
> 
> How about just:
> 
> strlcat() must re-scan the destination string from the beginning on each
> call (O(n^2) behavior). Use the seq_buf API or similar instead.

seq_buf API for appending something to e.g. boot_command_line seems to be odd,
since boot_command_line is usually "just there" (depending on architecture and
boot loader).

So if I would remove strlcat() from appending something to boot_command_line I
would end up open-coding strlcat(), including the chance for the usual
off-by-one bugs. Looks like this would be true for nearly all architectures.

Is performance really the only reason to deprecate strlcat()? This seems to be
a bit questionable to me.
