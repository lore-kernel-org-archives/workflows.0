Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C921933985;
	Sun, 12 Apr 2026 00:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775952179; cv=none; b=Am4EzpErnJyEX4O72XHNh9qwjrlS9RzsXUMBUIl9bZ7yBt8EE0F+MFDjxkHJJG4DiF/E9uBaLFKfJQXgNm9eQTL8toGo45Fe8OBd61/NcZXbA59I45neqjrB8Ga1+PNo0/q0B+UD35oWtakRaoAE23h+Q2MPjuz4htR6o5Eqv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775952179; c=relaxed/simple;
	bh=Hp9U7vnuz9gzAYjCtfVPRdjtc4p7/vdeGvWgu8SaH0Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZdWwelqPVcdiHQnKvE0JSLT5P8HStL0fyJOUdaTsTuaL3pvSXcPoNpg3oNo0yDNaVYSQGKUA8iqPoJ+9EigOzPAgcXrxAldYh8deQfhYG7eedDraMNkWHGUedIhf3NC7Ox2I5ha2WXTIXrBHnGS8gVUmgV7jHVURRpxQLYrB1kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ull8X6F5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ull8X6F5"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=xYV0z2MkuxdauR6WLoTXIg3DnfOmBbz6bOdf6SWJE9c=; b=ull8X6F5PfnIssMX01Hhv4bTty
	xIC4GpJ03ogn9spqTfvLpUkMT/RJxmqLBoVI8hH4BqLPyubW8I9EVC0KN7RuWy+athqNrSIoR3j3k
	S8Rb8biognb5wFW+bFy9OOHsuBU7XJ+A9dUgTqZhdt5JGzPH9HlP9gu0LOi1FIjdoZW7blUZ0fPPS
	L7K5IWzri1BSzdJ+zdmUZ7xrPWGWguvTL1TBrqJv9HAO5HqKppz2l9YS2jG3cfMpKrTQ9t3S404bU
	Jb6380tNZvS7pZeOHvl695pXwv6r1Ekqg4ALNoBmCzsOgxL/0U4fXIhGDr9UO7sCWq9aVlMdgBosc
	WVUpYqjw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBiHx-0000000Dts4-1ZLa;
	Sun, 12 Apr 2026 00:02:57 +0000
Message-ID: <a7421a41-458a-4925-a804-e31e2552c79e@infradead.org>
Date: Sat, 11 Apr 2026 17:02:56 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: maintainer profiles
From: Randy Dunlap <rdunlap@infradead.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
 <20260410101239.04c87f26@foz.lan>
 <d8804a85-dd2b-481e-903f-c6fea5d24c97@infradead.org>
Content-Language: en-US
In-Reply-To: <d8804a85-dd2b-481e-903f-c6fea5d24c97@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 4/11/26 4:54 PM, Randy Dunlap wrote:
> Hi,
> 
> On 4/10/26 1:12 AM, Mauro Carvalho Chehab wrote:
>> On Thu, 9 Apr 2026 17:18:39 -0700
>> Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>>> Hi,
>>>
>>> Is there supposed to be a difference (or distinction) in the contents of
>>>
>>> Documentation/process/maintainer-handbooks.rst
>>> and
>>> Documentation/maintainer/maintainer-entry-profile.rst
>>> ?
>>>
>>> Can they be combined into one location?
>>
>> Heh, from the 5 entries at maintainer-handbooks.rst:
>>
>>    maintainer-netdev
>>    maintainer-soc
>>    maintainer-soc-clean-dts
>>    maintainer-tip
>>    maintainer-kvm-x86
>>
>> we have 3 of them already there at maintainer-entry-profile.rst:
>>
>>    $ grep process/ Documentation/maintainer/maintainer-entry-profile.rst
>>    ../process/maintainer-soc
>>    ../process/maintainer-soc-clean-dts
>>    ../process/maintainer-netdev
>>
>> It sounds to me that moving maintainer-tip and maintainer-kvm-x86
>> to maintainer-entry-profile.rst would be enough to drop
>> maintainer-handbooks.rst, keeping them consolidated on a single
>> place.
> 
> Yes, maybe. How about in the other direction:
> move them all to maintainer-handbooks.rst?
> 
> After all, maintainer-entry-profile.rst says:
>   For now, existing maintainer profiles are listed here; we will likely want
>   to do something different in the near future.
> 
> Also, does anyone know why some of these profiles are numbered and some
> are not?  See
>   https://docs.kernel.org/maintainer/maintainer-entry-profile.html#existing-profiles
> for odd numbering.

Because they are numbered in their own respective documentation areas...

-- 
~Randy

