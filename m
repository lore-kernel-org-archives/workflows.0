Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E2D1A682E;
	Sun, 23 Aug 2026 18:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787510879; cv=none; b=il2n7R2j+8qVu21fR8pjjVEDcyjeEMFAjSv4FlFHjPmiMIZrJOCpU/RWHtwhlGYtflZj8IXpmxSykh6uFfK/QgCTJltu+7l6++rskg/gKGitZDWL7DiCr74CvMTzENwOdKn6KWa4fmRSNnHu7SfNC0CCUWmbL/56Qc+zjGIHzlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787510879; c=relaxed/simple;
	bh=Nxn14vEQBkUfYIBtyjiuvA7sEIBtZ1PfWA3p9j7I1jQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YpoOReevcW9CuEHJaXxXQoGEJPomOUYYiHdXRwXMoGt3H/sDKyVu5eI1kliVr6rCpQ1bircM6obIU3WP+jMwhESN1XS5DEVEzuf78V1+OZF/YO4lLc6aJbjRAkob6T/nSPQhJZkKTBiCznTblD/jiAPnVvi/YCUvYBzl7B1QYYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dgstOy8P; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dgstOy8P"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=tcMG4Z1+uf2vCda9VNuPmzBQzEqrpv/FGEvFZYtKNCw=; b=dgstOy8PAAPRGrdi8H+DusOB2m
	N+0IECov5q2YdEuFgLhoIPOXfq1+dc9T1LoDuXK3R2BlQd/EPBD/dl7mBV+yW8NBGni405y3BtW/e
	3cOs/KqmgeH1yNyPbumDmumPPGr7aZLKVJRgL97m0RWSwNUPsZWqP8lcJmCLTYympom8sMz7Ztt0J
	GD32aoV9CCuQp5ARZW3NBowpBpcdiD8o3tlLhTnNZVNZiPa6OChSbXxcSa8Tccoco3ynM/1y/B+jh
	i2k+sjG++eP0OikLNPLlepsUeHYYnN4VrSo6FBMZdhJZVJRbtaNJYkR3Lle3C3gnq/9u28ZdQsHWF
	mnNWam8g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyDEM-0000000FXJw-2oPA;
	Sun, 23 Aug 2026 18:47:42 +0000
Message-ID: <2b3b259b-d9a0-435a-b250-9d216ae504c7@infradead.org>
Date: Sun, 23 Aug 2026 11:47:41 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Issue] sphinx: incorrect high-lighting
To: Manuel Ebner <manuelebnerli@mailbox.org>, Weijie Yuan <wy@wyuan.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 "open list:DOCUMENTATION PROCESS" <workflows@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>
References: <bba57d51c72d9387ccef2b5979fa618e980c3ebf.camel@mailbox.org>
 <aosYfdfH6Z7ai5M2@wyuan.org>
 <c7a3db22f56c598ef35676288d10303af21098bf.camel@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <c7a3db22f56c598ef35676288d10303af21098bf.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 8/23/26 11:08 AM, Manuel Ebner wrote:
> On Sun, 2026-08-23 at 23:57 +0800, Weijie Yuan wrote:
>> On Sun, Aug 23, 2026 at 05:14:20PM +0200, Manuel Ebner wrote:
>>> I think in the documentation is some incorrect auto high-lighting.
>>>
>>> https://docs.kernel.org/process/deprecated.html
>>>
>>> Line 272:
>>>> when such a struct was in unions, structs of structs, etc).
>>> with 'struct was' bold.
>>>
>>> Line 358:
>>>> alone in a struct or is part of a union. These are disallowed by the C99
>>> with 'struct or' bold as well.
>>>
>>> Other files have the same issue:
>>> E.g.: https://docs.kernel.org/process/adding-syscalls.html
>>>
>>> Unfortunately I don't know how to fix this.
>>
>> Hi Manuel,
>>
>> I think we can just add "or" and "was" to Skipidentifiers, so that it
>> won't be treated as C identifiers.
>>
>> --- a/Documentation/sphinx/automarkup.py
>> +++ b/Documentation/sphinx/automarkup.py
>> @@ -51,7 +51,7 @@ Skipnames = [ 'for', 'if', 'register', 'sizeof', 'struct', 'unsigned' ]
>>  # when following struct/union/enum/typedef keywords.
>>  # Example: "a simple struct that" in workqueue.rst should not be marked as code.
>>  #
>> -Skipidentifiers = [ 'that', 'which', 'where', 'whose' ]
>> +Skipidentifiers = [ 'or', 'that', 'was', 'which', 'where', 'whose' ]
>>  
>>  #
>>  # Many places in the docs refer to common system calls.  It is
>>
>> But I find more words needs to be added when looking at
>> process/adding-syscalls.rst. 
> 
> It would be this list:
> Skipidentifiers = [ 'and', 'are', 'as', 'containing', 'element', 'in',
>                     'including', 'is', 'name', 'needs', 'of', 'or',  'page',
>                     'pages', 'passed', 'randomization', 'request', 'that',
>                     'to', 'where', 'which', 'whose', 'will' ]

We have a struct page, so this would interfere with it being
highlighted correctly, I guess.

Oh, and there is a struct element (not currently used as
kernel-doc).

>> Adding the falsely highlighted words one by
>> one may not be a perfect solution, since it could potentially affect
>> other places where those words should actually be highlighted. So I'm
>> not quite sure what the best approach is either now.
> 
> Me neither.
> 
> Thanks
>  Manuel
> 
>> Thanks.
> 

-- 
~Randy

