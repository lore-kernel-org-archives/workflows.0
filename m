Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BCD192D66;
	Mon, 30 Dec 2024 18:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735584025; cv=none; b=g+eHxUbSjMlFouxJkc92kQAg3Wc2M58IK+Bximh2gCfbKFjSw0aoVULKxSsTNgmGW6IZmkig4kMs4LJBdLXl0r1t/hsdwJ3xBFJG5Q5IL+hDIZOUILVEleCjfIKeia50um/LcxnkwuBfXSFdsU4z8ex+QqPCZoodXXQHS0+CTro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735584025; c=relaxed/simple;
	bh=v7LUdKiXIF/2hRcwsGTrsO/WcbOEWSIXkejY4YWOfcE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d9g7wLlrU3p/YRIXBJXh74kNx9Y3MWKMCh8+Z0E8SSdER0ueOEGW7mhdLIDxqhF852YldWg6nhBW8NSqCN0U2hcknAY+W1AUly3co2RYBMsl9VUEihiO6Izq4P/QHDUdQI/4V0c3Qmt+5FyVuVCvfJP9iTq19xDhIhFMGKpaAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oQQQdWgD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oQQQdWgD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EB9F0404EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1735584023; bh=WHD28073BZDSvPJWeaEAreWwhxbOeGD3u831qJss8hs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oQQQdWgDKXNl6MevpLjWa7WXjmPlxK6AgWFJ6HmzvY5N17/vnkpC/crBGcIl4nfBi
	 r55/y154/CcK6p287De9EzUEYqC4Lv2NvYRWWc9yHT+iQIbjzhW9pPUYzfJqhjAyv/
	 51zTQpzFKD2Imi6XGE85xyYK0KjUv37FjmR0S6RXJTtCHfzGpoKJQ00bwyn5Z5z9AQ
	 I0p9x2lzNWtY3VGtHRylVtCR0cwL+0FbXB6uUtQ7qG1uxfs6QVjz2ATO/Mk8+c/7LJ
	 SXIcRmhq/au2ektW+HzKLHcNq/CP+ew6lxoEw50gqE5r4Wx7fNeLzLsDX72Ni8QWc5
	 U46LQwMS8bXwQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EB9F0404EE;
	Mon, 30 Dec 2024 18:40:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Borislav Petkov <bp@suse.de>, Rob Herring
 <robh@kernel.org>, Frank Li <Frank.li@nxp.com>, kernel@pengutronix.de,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: Re: [PATCH RFC 2/2] docs: process: submitting-patches: clarify
 imperative mood suggestion
In-Reply-To: <20241220-submitting-patches-imperative-v1-2-ee874c1859b3@pengutronix.de>
References: <20241220-submitting-patches-imperative-v1-0-ee874c1859b3@pengutronix.de>
 <20241220-submitting-patches-imperative-v1-2-ee874c1859b3@pengutronix.de>
Date: Mon, 30 Dec 2024 11:40:22 -0700
Message-ID: <87r05p10bt.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ahmad Fatoum <a.fatoum@pengutronix.de> writes:

> While we expect commit message titles to use the imperative mood,
> it's ok for commit message bodies to first include a blurb describing
> the background of the patch, before delving into what's being done
> to address the situation.
>
> Make this clearer by adding a clarification after the imperative mood
> suggestion as well as listing Rob Herring's commit 52bb69be6790
> ("dt-bindings: ata: pata-common: Add missing additionalProperties on
> child nodes") as a good example commit message.
>
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

I'm rather less convinced about this one.  We already have a whole
section on describing changes.  Given that this crucial document is
already long and hard enough to get through, I don't really think that
adding some duplicate information - and the noise of more labels - is
going to improve things.

Thanks,

jon
