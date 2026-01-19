Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29EB1DF759;
	Mon, 19 Jan 2026 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835018; cv=none; b=DIt3+8LcHkKnSp2WIxy0tqotzO2yCGoNb2UHi9Iz/do6HHo25KFoUTnQ4MbKvEcuWj/oEVkT0m80gPQyAWUexdUZWS8tk78J+4lLoUnAJdqs4I5O8q8o9aA8rNXpBbyCc1MQ6Q3N7UPa3F/YKwO4dBA0Nvqp6fPTgpK7VCcPOMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835018; c=relaxed/simple;
	bh=FuskobfTqve33elwdkv8Ehc0LmDBb5Tvnot0ep4LBV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=eVofLbZlDU2uJsIipXcqWpXDB/37jvpCqhU5U9F8EbWnbPBtNx+GAjPVZkg8VF6mdYg9y0M/382V8vrf2sq3GQl5OwJ9IVwP98+RibxtRqHEYv2t7vpAB14MrAAuhZB1b3cG3an5lOnYCdiNruLZEFWKq9xwkoBI6sbuW+cpzyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kqivEJ+D; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kqivEJ+D"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 681C440430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768834445; bh=FuskobfTqve33elwdkv8Ehc0LmDBb5Tvnot0ep4LBV0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kqivEJ+DaLLM//Z9CXZ0+gh2YBqZVraxtk4UpoZuniWs5H+phAzNla62oAVjHTvvh
	 n7KaCrPwZvDT1T/CelLwCivO9cxCcTs6wKMCj+fuYdHDLj3WCGFaOnsgJdL9ictmK3
	 GzhttPgDwtwlPbSRph/5m2nr24ka7sgF8kx0Q7aZLbP1ZOL1d/kZ2ifBk+PE3cGjla
	 rUXeWZmXk9B+MstgbMQG1IbXKq2Apuz/uZiornZRfYGjTXfYNqqM2CQUEXLud0lp9P
	 +Jz3rTBS/RsbAIRdG9rxyq+aedZ59Pm7sNVRjq5bjNpgfY2ikH3L/nLu9VKddyv4KA
	 3OP7AhQRkxafg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 681C440430;
	Mon, 19 Jan 2026 14:54:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Thompson <danielt@kernel.org>, junan <junan76@163.com>
Cc: jason.wessel@windriver.com, dianders@chromium.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] doc: kgdb: Add description about rodata=off kernel
 parameter
In-Reply-To: <aW5EhId-E6TzvR89@aspen.lan>
References: <20260116050410.772340-2-junan76@163.com>
 <aW5EhId-E6TzvR89@aspen.lan>
Date: Mon, 19 Jan 2026 07:54:04 -0700
Message-ID: <87tswhlkkz.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Thompson <danielt@kernel.org> writes:

> On Fri, Jan 16, 2026 at 01:03:13PM +0800, junan wrote:
>> STRICT_KERNEL_RWX can not be turned off throught menuconfig on some
>> architectures, pass "rodata=off" to the kernel in this case.
>>
>> Tested with qemu on arm64.
>>
>> Signed-off-by: junan <junan76@163.com>
>> Suggested-by: Will Deacon <will@kernel.org>
>
> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>
> Jonathan: do you want to take this or should I take it via the kgdb
> tree?

I'm fine either way; I'll pick it up shortly unless you say you've
already done so.

Thanks,

jon
