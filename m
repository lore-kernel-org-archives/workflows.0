Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF8033B6E8;
	Sun, 16 Aug 2026 15:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786892840; cv=none; b=jyPNKnCWvrBK1u0v2eaoHGX6uMv4cJFMF3bp4jg94o8pYMPD0rW2V0LStnEHzgN8mJxhoPB1GnCdOBDFln9FQIG/SdB4npKauWxpfgy4pUdmcK3DxZCf45+kDI3JndEu/+eHBNhHkmnQYpl8jVXMTFsmo6v9nrOIk36Qu0oSy8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786892840; c=relaxed/simple;
	bh=RvDzWrUQXnBPfz2GyGQ4U/TjePFBR22aq+W8SLWtf1E=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=osY1bRyBqYITxncOtIzwwYFtIbPu8wjW9O5kBq5+Kt/W0XtepOp7dduiMdUfDakgIv5DuwaUh5N1BP5YeURCjBid5GEdmuNGemFEx0TFde1PAZ1yXBXilUxOw6DZ09x+I42iep9GSH0kED0D8LSTcS6ZarkRmImywe+k5QoCNSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=QFN32AON; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QFN32AON"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
	bh=s9WPLaA3P7/PToO+CE80QG/+c+JL67SJSr15Liqzjsk=; b=QFN32AONp009pIqx5gMrvYGAMP
	QmHnxYp13XG+uOYOs8wh6v+W5BPVrbZgCXwITDr8kmzVMZBNJ0nyYMEm6oV8llLXqTg+6TbgSgSVG
	1PPTx8zh8gKPa27i1M3oz7+/ZZy7T3+AWX/Cb+g4Y8B3qM8VYwLrpurGc859nmbnRV8UmRqnEYBbb
	r8BgyHCIXxPFyURmkb6AjoqEh1uoPsIMgln26BxDxjdxPIpT4Y6Jl6UvDrCkOM7wei9dsM9WN3foR
	grwiMRBHiRqJaXnjrASyagLUPWNi3BKcvl5tntTq4rIOB/6+EzvOVRLc+SMlxv7skQhnRzDymZQUz
	6x1TlwcQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvcS8-00000004qwu-44Zy;
	Sun, 16 Aug 2026 15:07:13 +0000
Message-ID: <4585926b-f884-4638-83f9-00da23edfcca@infradead.org>
Date: Sun, 16 Aug 2026 08:07:12 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Doc: process: Getting rid of OProfile url enlisting
To: Manuel Ebner <manuelebner@mailbox.org>,
 Bhaskar Chowdhury <unixbhaskar@gmail.com>, corbet@lwn.net,
 skhan@linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260815220029.3711742-1-unixbhaskar@gmail.com>
 <875527abdf9df0393ade872c6df3612ae9945b44.camel@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <875527abdf9df0393ade872c6df3612ae9945b44.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/16/26 1:24 AM, Manuel Ebner wrote:
> On Sun, 2026-08-16 at 03:23 +0530, Bhaskar Chowdhury wrote:
>> Aren't we done with this damn tool from a kernel perspective?? Thought,the link
>> could be removed.
> 
> This would finalize (fix?) this commit 8e9fa2f21151 (oprofiled version
> output line removed from the list)
> 
> Maybe add some reasoning (To reduce it's OS jitter or because it's a leftover link)
> 
> And if it's the way to handle translations remove:
> Documentation/translations/it_IT/process/changes.rst:- <https://oprofile.sf.net/download/>
> Documentation/translations/pt_BR/process/changes.rst:- <https://oprofile.sf.net/download/>
> 
> I have no clue about the technical side, that's why I'm asking:
> Can this be removed aswell?
> arch/sparc/kernel/nmi.c:atomic_t nmi_active = ATOMIC_INIT(0);           /* oprofile uses this */

It looks like nmi_active is used in that source file regardless of
oprofile. I'd say No.
Other than the comment itself, which can be deleted if oprofile support
is going (gone) away.

>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  Documentation/process/changes.rst | 4 ----
>>  1 file changed, 4 deletions(-)
>>
>> diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
>> index 0aa232b117b5..336c07190c9b 100644
>> --- a/Documentation/process/changes.rst
>> +++ b/Documentation/process/changes.rst
>> @@ -556,10 +556,6 @@ Ip-route2
>>
>>  - <https://www.kernel.org/pub/linux/utils/net/iproute2/>
>>
>> -OProfile
>> ---------
>> -
>> -- <https://oprofile.sf.net/download/>
>>
>>  Kernel documentation
>>  ********************
>> --
>> 2.54.0
>>
> 

-- 
~Randy

