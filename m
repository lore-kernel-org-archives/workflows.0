Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522EA281341;
	Thu,  4 Dec 2025 20:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764880973; cv=none; b=DsJ/lL7oqRTDUvVVJKOVLFBXMnfDDB1s5Dh5/2N4E43aypPBRgFxOH67g0sg7Eg7YG3AEsGO+HoxR3KXmUmCmVBnIA2ipM2LD966ywRVbhQSbXDfeM8iEKMgfA93IUULrzcl20VBxyGkP2kWhSHf9OCNdzC0UDCGx98htm09FEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764880973; c=relaxed/simple;
	bh=2PC+zqDtzMDJ+WDQehJHGfN5F2nbbhWaHAhegCzbqyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CgAWKQqL2K/CeHoqJJVX7IGU364q5vdyw2CSMLvJQTCHKG4lHWwYHqrguus9caMrOSYBa9rhNMbY1u+viV7BGVbGe7a1+ROSXngI0ac3DYuHBbmoM+XBMHLsNtyGDESNVlrmuthUoVEhzIbX4+Njeyc83J3DI5RQqyKV1BLt9qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=EWzziqwt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="EWzziqwt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE911C4CEFB;
	Thu,  4 Dec 2025 20:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764880972;
	bh=2PC+zqDtzMDJ+WDQehJHGfN5F2nbbhWaHAhegCzbqyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EWzziqwtMVVS9DDJvo9njAhu8edzo6q2Dtj5WKcahYDV0ae/KdFaJW49acUQcll+P
	 uLp9wlXAQjBuRpKh53FQ0j3cCsvoYJee6tRC4w4MqxQUg1UAblJWFzeYY8mvrwxzMk
	 6emnzB2UFl007YEZj9T4YO1erKPB8qXx3Wk173Qs=
Date: Thu, 4 Dec 2025 15:42:51 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
Message-ID: <20251204-imperial-crane-of-psychology-ddd0bd@lemur>
References: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>

On Wed, Dec 03, 2025 at 08:43:47AM +0100, Uwe Kleine-König wrote:
> -    If you are listed in MAINTAINERS or have an account at kernel.org,
> -    you `qualify for a free Nitrokey Start`_ courtesy of The Linux
> +    If you are listed in an `M:` entry in MAINTAINERS or have an account at
> +    kernel.org, you `qualify for a free Nitrokey Start`_ courtesy of The Linux
>      Foundation.

Reviewed-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

-K
