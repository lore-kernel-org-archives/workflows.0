Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AD1213E7A;
	Sat, 11 Apr 2026 23:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775951642; cv=none; b=DmVVmaTog3p1Bpb8ExmF7sTCvhj32cAFbAOytPfsPsQauZwN8yYRrsBi1gzFba6vn4rZjKplpoM2WM7ree1XMK9yefeEkCpKWN+mhACett4xFfNl51vAgW8M3ze1Bpnnys21vKTVawz+vpC81PHTzDhYW6jEoQ41nxsqlg+AvBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775951642; c=relaxed/simple;
	bh=Dg3eabWS5jdPjdJ7DmahxrQkq8UHpRr4d3JdFrBD7gA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H8MH2QnBBrgrGibSL30SsmZ8Nwbyse3Lz6i3U4d0U+8Obr3kE6BtegmRai3Tsic3ScACvXZzGFwLCAEN8I4qC7Z7G4mjenfCpIAJ9EtkSH9wtBpHe7rUOTxLYCa1zEYP6Y1Ogp0JSnN5MHGEAcTgZ6IMLBERhzi6ikiqNa05p7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=vPrG5ClW; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="vPrG5ClW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=a21D2mEaR49HM+018yMEjZFvKYwCEV59EYaWrU9+pbk=; b=vPrG5ClWyjTBpUrhmgMSrPfIsu
	zAp5hnvKYAYaxn1mY+UGNrE04gQ6rmV3OwKPx1A8LEhldOkUsy6OqVm/mq0nuZRJMmJJBrxofeSsF
	SjmR1wy2QNWFAr3UWXMAy4TygHxi/q9gbarrwVl7Sld7+LTjJXdTUA15ah9xS+TnpSkvIX/jyoF4R
	lXByajyjQT7sytPF8N4r3n+ZCkE3wq+prXXCPFNgkJYrggDGrOReLlLZ9ndlwX+4XzIUbQ300oaCZ
	BoMDJDIYpcGvZP2F3bI085iuD55bW0P+N3WOu+yAGue3E2Tmq1clWCg3/8xpRzJEUFpJhT+utMtL7
	urS5yjEw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBi9I-0000000DtcN-2cjw;
	Sat, 11 Apr 2026 23:54:00 +0000
Message-ID: <d8804a85-dd2b-481e-903f-c6fea5d24c97@infradead.org>
Date: Sat, 11 Apr 2026 16:54:00 -0700
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: maintainer profiles
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Documentation <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Linux Kernel Workflows <workflows@vger.kernel.org>
References: <b7775383-da94-4098-8af9-2f672c4f1a71@infradead.org>
 <20260410101239.04c87f26@foz.lan>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260410101239.04c87f26@foz.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/10/26 1:12 AM, Mauro Carvalho Chehab wrote:
> On Thu, 9 Apr 2026 17:18:39 -0700
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
>> Hi,
>>
>> Is there supposed to be a difference (or distinction) in the contents of
>>
>> Documentation/process/maintainer-handbooks.rst
>> and
>> Documentation/maintainer/maintainer-entry-profile.rst
>> ?
>>
>> Can they be combined into one location?
> 
> Heh, from the 5 entries at maintainer-handbooks.rst:
> 
>    maintainer-netdev
>    maintainer-soc
>    maintainer-soc-clean-dts
>    maintainer-tip
>    maintainer-kvm-x86
> 
> we have 3 of them already there at maintainer-entry-profile.rst:
> 
>    $ grep process/ Documentation/maintainer/maintainer-entry-profile.rst
>    ../process/maintainer-soc
>    ../process/maintainer-soc-clean-dts
>    ../process/maintainer-netdev
> 
> It sounds to me that moving maintainer-tip and maintainer-kvm-x86
> to maintainer-entry-profile.rst would be enough to drop
> maintainer-handbooks.rst, keeping them consolidated on a single
> place.

Yes, maybe. How about in the other direction:
move them all to maintainer-handbooks.rst?

After all, maintainer-entry-profile.rst says:
  For now, existing maintainer profiles are listed here; we will likely want
  to do something different in the near future.

Also, does anyone know why some of these profiles are numbered and some
are not?  See
  https://docs.kernel.org/maintainer/maintainer-entry-profile.html#existing-profiles
for odd numbering.

thanks.
-- 
~Randy

