Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B64D346FCF;
	Tue, 20 Jan 2026 21:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768946253; cv=none; b=HMiKP7E6sZWfydDTomzERmr2HhCcRgFRTUmdVtxqBJmMLtzs1CtKXAWhMNZu77q/mb3rrFvoj/I3Wi+n3qfQQZTiUaTQJ2N6LDzNbWXUiQQXKCX98DGDYJHpBDcsigfYUDCk3u78CYIBVkuITFvSai1pLcalcDoPiwn1fYM/RM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768946253; c=relaxed/simple;
	bh=GR/T74euQZ+vr4mwmrV5h6gP3Xs0x1K8urT5OcaMFQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GoY72bBEWxotBjiQ7LJqtEgXOI78poaMDP8JQL2GwV69xCIF+qa2W6a+bZvh4OVYpX5a996fY1IqGqgo74H7Wawaf9PdAnxySU8+u5mSZuS1ex3+tvxNmUfNimP/x1n6fIEsDQjZJSRv3jqfW4RSr094EkmydVESDdLSXPXJRCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sxVyrEkr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sxVyrEkr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 14B2C40C27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768946250; bh=GR/T74euQZ+vr4mwmrV5h6gP3Xs0x1K8urT5OcaMFQo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sxVyrEkr6UQmVx20j5g0kauYrLHlnRB8CdcrZYnv0sOS/drDc5+35mNbXR0eDZ/oG
	 43GtdIrSQZQhERJ8DVtdCtDLGVsUXR8QPVjjUVQyv3aS6+yuTBDPD/xyVBnK4FkZlS
	 Hob+UFjKu8yjzH8RTqQ0xAHe2mteicqy5ne2EkYWwdbS8qhp2n8ONOcDHTbVP7oWL2
	 uhGeBMZNZ9pPWsbOV3ObZ1l/oqySlOyd+lQwNgttsjI/yuk8+aXzBLYcNA6gh+/7Pd
	 gfEb/c70kvV5RqoparsLIrkez2IutMM8dcAYtnbL7BVRMu6pMsGD05gXHeLGt38Lt4
	 cgYFB1tUm5NRQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 14B2C40C27;
	Tue, 20 Jan 2026 21:57:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Thompson <danielt@kernel.org>, junan <junan76@163.com>
Cc: jason.wessel@windriver.com, dianders@chromium.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>
Subject: Re: [PATCH] doc: kgdb: Add description about rodata=off kernel
 parameter
In-Reply-To: <87tswhlkkz.fsf@trenco.lwn.net>
References: <20260116050410.772340-2-junan76@163.com>
 <aW5EhId-E6TzvR89@aspen.lan> <87tswhlkkz.fsf@trenco.lwn.net>
Date: Tue, 20 Jan 2026 14:57:29 -0700
Message-ID: <875x8whrqu.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Daniel Thompson <danielt@kernel.org> writes:
>
>> On Fri, Jan 16, 2026 at 01:03:13PM +0800, junan wrote:
>>> STRICT_KERNEL_RWX can not be turned off throught menuconfig on some
>>> architectures, pass "rodata=off" to the kernel in this case.
>>>
>>> Tested with qemu on arm64.
>>>
>>> Signed-off-by: junan <junan76@163.com>
>>> Suggested-by: Will Deacon <will@kernel.org>
>>
>> Reviewed-by: Daniel Thompson (RISCstar) <danielt@kernel.org>
>>
>> Jonathan: do you want to take this or should I take it via the kgdb
>> tree?
>
> I'm fine either way; I'll pick it up shortly unless you say you've
> already done so.

...and I have just done that, thanks.

jon
