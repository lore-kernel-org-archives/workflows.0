Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B41634CFC3;
	Mon, 22 Dec 2025 22:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766442695; cv=none; b=BgR/6eOqjC4DsobhiZWlMkj1m/gFewA37F9ODE+9lDwMYGynPn7eh1fQ2heBQ2Jv9scDTuVfKngWdk7ePuzPGlbcx/SRS9Zluv9W3iTWtlMnD31ADRGBu04ZDz2EaIE2RXYi6zliSbxVsdYz7KJSoal/SCmDfVsiLKMimttK0gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766442695; c=relaxed/simple;
	bh=EiRwF4LN1Tc08DoVH9UdVYc7uMaRfsK6GkGJG1ohpGM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pfbOA0tI+71JEMpQapTmsr3WfwRjZsoQyOTfzz8IK3k8+Cn8pjv5XLAO50gZbpzmkR3+NJ1GAXiGvkqT/KXsbnLt1FNnmW7MeEq7EE44FujAzu4TzFnMFHYrQ76ZmLekQAYeA1K0u6TYfF7fh5AHVEhej5VLuhjLvtRAtuISE/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=mgWT7tFO; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="mgWT7tFO"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8F8154040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766442688; bh=ePrTJ9v029CIoHfRP0yZZPAKNrTeHtE2BSRVB7OCN28=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mgWT7tFOm9mCYgDf7Y/UpkTbmmi6V4AJayl/d4MVYMbEglxIQOPMZKDp0F8rHcVmy
	 0b4r5rEjpfUw3Fhc8GsNbzRmnqlTobELfXhhT3UzeZ2/fTborYl8meNJDMIZ5l0pLD
	 felZ9xRe4G3qxDc9+MGK98x2NzNh0pxtSoS6oJmf6zAUNWS5pHHIXGFdPEWp8epMbO
	 Fx8WRyLJvAmtuM62YElk8vL2c4KsK+K3KzY4POO1T4fwVFmN9d+nF9O63mGWfkr3Zb
	 eWf/rC89PQ8tegpxMQTf0TYy6cU/u347bHfWm7m90H8ChLLRw8rskuAIWp1tAQpsa/
	 MZxFkGwb+d6Jw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8F8154040B;
	Mon, 22 Dec 2025 22:31:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: Improve wording on requirements for a
 free Nitrokey
In-Reply-To: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
References: <20251203074349.1826233-2-u.kleine-koenig@baylibre.com>
Date: Mon, 22 Dec 2025 15:31:27 -0700
Message-ID: <878qeuywqo.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> writes:

> "listed in MAINTAINERS" is not enough to qualify for the free Nitrokey
> Start. You have to be listed in an M: entry. Mention that to reduce
> confusion for reviewers who wonder why their application fails.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> ---
>  Documentation/process/maintainer-pgp-guide.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied (finally), thanks.

jon
