Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B318B33B95A;
	Thu,  2 Apr 2026 19:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775157463; cv=none; b=UjDkV1XD78D9HT8Tl53tFtyZGaf/QfTdBBqiok1fGQulyQwh7+2KuMrzpEFzkiolPwRLgZs96Q/Q68zqZiOFoIki+sTUuUZ/57IktTNuI5OlKDL09/tJNUoYjSeE/3LRBDWsOB6cSQRooHTgHXPf31ql2bjtyWyZNqsuvzuXFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775157463; c=relaxed/simple;
	bh=P5GwLa70kB9H0lFgzQOcglQM4Lzd6IZ8Dl99aoMajrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CLWJfxFWSAL5TlhYi+WxIFQk/9oC3ac0as7XUen9Dn57t9nvwscy4CLsAfqVQAviAbYeuAWPJOVEu7bdzK8fRHbkHtQPx/rfZ9QKK7VWJe6G80diU9K1D8aeW7pgmEhD3CDvgAmS741TEdu+HlgOXcHAn2sg6FK48xlFvOFlzJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ndi6xaPO; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ndi6xaPO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=A17G2nzlrMF+znRDluTMTSBJcMXRCdcqKCwbxUPvpcM=; b=Ndi6xaPOOqX59Xg6FIE4ZCDJ+G
	sLCtIgfPlsgso0CJw5/0nabH0CvK9XMk+PuwEiu3YXMz8R7GzkWx5REBK+YAPnhWHjVpKds79aQQq
	bqRmUG9woVt2HC1x2jrIx7wf7M9OXi2hrSkFiQpjg1n1Kk7fyzDYyOQDZVPfu0rswzCIiX2KEYWv6
	e9SB5o1ZnFAkRkLZKOLEvWSUg/5TQ0xpi+gk0J14IBiKGbwyMRZgbP94ho2eCsD6Hl90yzdNDESnO
	+LH58ua1ehOR4StnjgXgn723kC5YzyX42McBKxr1MdZyJEy/aCQFdBQJLOTKnSY4n7QvBHLF7jLm6
	hEpeFy9w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8NXv-00000000i7i-0Rax;
	Thu, 02 Apr 2026 19:17:39 +0000
Message-ID: <d26e37d4-0a29-4aaf-9034-3e1cc91bc6ce@infradead.org>
Date: Thu, 2 Apr 2026 12:17:38 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] Documentation: clarify the mandatory and desirable
 info for security reports
To: Willy Tarreau <w@1wt.eu>
Cc: greg@kroah.com, edumazet@google.com, Jonathan Corbet <corbet@lwn.net>,
 skhan@linuxfoundation.org, workflows@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402182655.8636-1-w@1wt.eu> <20260402182655.8636-4-w@1wt.eu>
 <18127458-1951-4b44-bcbb-a5747a3b4b6b@infradead.org>
 <ac69iG5fihUd82yH@1wt.eu>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <ac69iG5fihUd82yH@1wt.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/2/26 12:03 PM, Willy Tarreau wrote:
> Hi Randy,
> 
> On Thu, Apr 02, 2026 at 11:50:00AM -0700, Randy Dunlap wrote:
>>
>> On 4/2/26 11:26 AM, Willy Tarreau wrote:
>>> A significant part of the effort of the security team consists in begging
>>> reporters for patch proposals, or asking them to provide them in regular
>>> format, and most of the time they're willing to provide this, they just
>>> didn't know that it would help. So let's add a section detailing the
>>> required and desirable contents in a security report to help reporters
>>> write more actionable reports which do not require round trips.
>>>
>>> Cc: Eric Dumazet <edumazet@google.com>
>>> Cc: Greg KH <greg@kroah.com>
>>> Signed-off-by: Willy Tarreau <w@1wt.eu>
>>> ---
>>>  Documentation/process/security-bugs.rst | 66 ++++++++++++++++++++++---
>>>  1 file changed, 59 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/Documentation/process/security-bugs.rst b/Documentation/process/security-bugs.rst
>>> index 6937fa9fba5a..b243ac24eb12 100644
>>> --- a/Documentation/process/security-bugs.rst
>>> +++ b/Documentation/process/security-bugs.rst
>>> @@ -7,6 +7,65 @@ Linux kernel developers take security very seriously.  As such, we'd
>>>  like to know when a security bug is found so that it can be fixed and
>>>  disclosed as quickly as possible.
>>>  
>>> +Preparing your report
>>> +---------------------
>>> +
>>> +Like with any bug report, a security bug report requires a lot of analysis work
>>> +from the developers, so the more information you can share about the issue, the
>>> +better.  Please review the procedure outlined in
>>> +'Documentation/admin-guide/reporting-issues.rst' if you are unclear about what
>>
>> Drop the single quote marks.
> 
> I just moved this part as-is, and I've been extremely hesitant to change
> formatting as I can't easily check the validity of the output.
> 
>>> +information is helpful.  The following information are absolutely necessary in
>>> +**any** security bug report:
>>> +
>>> +  * **affected kernel version range**: with no version indication, your report
>>> +    will not be processed.  A significant part of reports are for bugs that
>>> +    have already been fixed, so it is extremely important that vulnerabilities
>>> +    are verified on recent versions (development tree or latest stable
>>> +    version), at least by verifying that the code has not changed since the
>>> +    version where it was detected.
>>> +
>>> +  * **description of the problem**: a detailed description of the problem, with
>>> +    traces showing its manifestation, and why you consider that the observed
>>> +    behavior as a problem in the kernel, is necessary.
>>> +
>>> +  * **reproducer**: developers will need to be able to reproduce the problem to
>>> +    consider a fix as effective.  This includes both a way to trigger the issue
>>> +    and a way to confirm it happens.  A reproducer with low complexity
>>> +    dependencies will be needed (source code, shell script, sequence of
>>> +    instructions, file-system image etc).  Binary-only executables are not
>>> +    accepted.  Working exploits are extremely helpful and will not be released
>>> +    without consent from the reporter, unless they are already public.  By
>>> +    definition if an issue cannot be reproduced, it is not exploitable, thus it
>>> +    is not a security bug.
>>> +
>>> +  * **conditions**: if the bug depends on certain configuration options,
>>> +    sysctls, permissions, timing, code modifications etc, these should be
>>> +    indicated.
>>> +
>>> +In addition, the following information are highly desirable:
>>> +
>>> +  * **suspected location of the bug**: the file names and functions where the
>>> +    bug is suspected to be present are very important, at least to help forward
>>> +    the report to the appropriate maintainers.  When not possible (for example,
>>> +    "system freezes each time I run this command"), the security team will help
>>> +    identify the source of the bug.
>>> +
>>> +  * **a proposed fix**: bug reporters who have analyzed the cause of a bug in
>>> +    the source code almost always have an accurate idea on how to fix it,
>>> +    because they spent a long time studying it and its implications.  Proposing
>>> +    a tested fix will save maintainers a lot of time, even if the fix ends up
>>> +    not being the right one, because it helps understand the bug.  When
>>> +    proposing a tested fix, please always format it in a way that can be
>>> +    immediately merged (see :doc:`regular patch submission
>>> +    <../process/submitting-patches>`).  This will save some back-and-forth
>>
>> Hm, I don't see anything in submitting-patches.rst called "regular patch submission".
>> Is it in some other patch?
> 
> Not sure what you mean. Is this supposed to be a sub-section and not just a
> title ? On https://www.kernel.org/doc/html/latest/process/security-bugs.html
> it appears as the title. This one was already present in the same document
> and was moved there without a change.

I see. Sorry for the noise.

-- 
~Randy

