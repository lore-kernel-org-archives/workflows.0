Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F37E2163AB;
	Tue,  4 Feb 2025 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738692327; cv=none; b=gqEUc8Oxqf3eiOzEoTeS+mBsZcS+eeSbQEu3SHt7QAlmEUvnGDv6anqMJgicdzISJcPcBZY+0yF6T44tEsd2Orz3xDGgwhs/VPaeeEOBannh4VVnA4P9NqjSiE7TfU1F9F+qA/3NdkzZxEeG4NU0crQLzIviknf8VVEWdQ1UvPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738692327; c=relaxed/simple;
	bh=LoMZHVjyEpIFSHfyF7bxTUEmMGlompNah9BmRXMYefg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oj/z5raicsWfxbaY8zgLx043LxyRlBxQDnKuX4pE03StNbb6XxYfLs28IwlKtJFtEt4V17Tqh7/8Ya1XT8BxqD/qaH8eXUlTO/ifsKQRCPw2NY/7MLmNpzkQZIM2ZckdFoodbwtlDJFxN6BNXV0+rLrqwx4ZwpUPsCtOee5M2Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gjiD4vEi; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gjiD4vEi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qBX9m8ekS4Kp+9Wad1wgzoJlpD+MLcBX2hMNvd5DLw8=; b=gjiD4vEicC2JSdHKobROHP3h67
	XCTSscvEfxX19ZRj5O8kZKOKXI+Gger13Aqvow/9ndTY5wZ5qNY1kDyN5JL2UuLbz1Hd3zDfBqMR0
	2DgUFYDtRoAokYl4tuQ5aCIkTRFd80t4ViMM7Y0ijOxeFPnVFteHNKfpgKyOb/9x3ZB2V5RgaE8Fi
	evzf/6rixo8wtOdzjOTP1yThicPepna/4vnJ3477EXVKCUrO6JaGJwiRUhlvM6d/tk2Edt7S723zs
	ZyzASVqsF4rzmrX7e5a7xYBUW50G5MapiTGtVZVok27ZivCsGb/Kj7PFHegHxfUaRcyx9H/GdCVWA
	s7ursw3w==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNIT-0000000GNBe-3Bwz;
	Tue, 04 Feb 2025 18:05:18 +0000
Message-ID: <4f27a0db-256c-4792-a957-1387de9dc56e@infradead.org>
Date: Tue, 4 Feb 2025 10:05:12 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: submitting-patches: document the format for
 affiliation
To: Jakub Kicinski <kuba@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, corbet@lwn.net,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250203174626.1131225-1-kuba@kernel.org>
 <CAMuHMdXXNkpWjkKvMLd-MF=npzqJXMtnXkaba60JY7hCzyjz7g@mail.gmail.com>
 <20250204071834.78e0ffb1@kernel.org>
 <20250204154938.GF22963@pendragon.ideasonboard.com>
 <20250204081301.6fdb1536@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250204081301.6fdb1536@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 2/4/25 8:13 AM, Jakub Kicinski wrote:
> On Tue, 4 Feb 2025 17:49:38 +0200 Laurent Pinchart wrote:
>> Or apparently project or customer names for consulting companies:
>>
>>      29 Kory Maincent (Dent Project) <kory.maincent@bootlin.com>
>>      34 Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
> 
> FWIW these are customer names, indeed. Project/Foundation pays for
> contracting work in both cases.
> 
>> The other cases correctly refer to companeis, for contributors using
>> other email addresses:
>>
>>       14 linux.dev
>>       41 zytor.com
>>       47 joelfernandes.org
>>      176 alien8.de
>>      243 gmail.com
>>      333 goodmis.org
>>      454 armlinux.org.uk
>>      918 infradead.org
>>     1007 kernel.org
>>
>> Do we want to only document existing practices, or also tell which
>> one(s) should be favoured ?
> 
> I'm hoping that documenting the most prevalent existing practice
> will naturally make it favored. IOW I'd prefer to document just 
> one option. I don't really care which one we pick, but the brackets
> seem most common.
> 

I thought that
Signed-off-by: John Doe <jdoe@example.com> # Company
would be acceptable also.

It looks like that format is documented for Acked-by: but I don't know
why it is not more generally applicable. I'm pretty sure that I have used it
a few times. ;)

-- 
~Randy

