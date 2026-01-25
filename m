Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA891C5F1B;
	Sun, 25 Jan 2026 15:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354207; cv=none; b=ElLHar9KNoucNaHfjcm3zO1Z4xyXZY59vIFs+465fxKvqmysFzG8YfWcUUE6NZdFbIssMj7kjShFQ9bhq0X/WDe4maAE2qzly2y6CPXLWrD9CF8N7Qz+NJkNxjxegR03+vv8n+unjQP/M/vo2aQ5/Koqy6OszgSzfIW2k5JKocQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354207; c=relaxed/simple;
	bh=jMtqX+W5MjPFGnG7XorCa653Ix27UzzVbJ92NBBOj08=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=pTdu+mGnOf4+Flk3rUnRjYgMTdYw5/oAscOQBG5T/8UhAdWrLSULji/CcQzvHNiV0urzSg42xG7QatHsjqXPq6dzuqF5Xu/qsfxgXuwcPTgxhREr5tBXopbLt/6UN/1V1Ga1svTgC/EeU7RkKXj4znfaNPDKXim4HR0gDdN27lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=KVbXTAcQ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="KVbXTAcQ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2B1B740425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1769354199; bh=lkC0RWcquQrWhPJTrhi6kyL0NFESSkVNBV/HwVZm5V0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=KVbXTAcQLRgw7JDql7Eugw8glAghD0o4JKp/XqsyuelvgvivaV71M8gYcVmR6Pix0
	 QqJGUsjd8jktob7thhVQ3zuYk0mjWdaFpfJGk8ryrkOa7E29aIXvz3MC/sYZw/khrX
	 D4HHlJG6/yPFAo+vRQw5Fh44V7dJUypsL0WgSAXYxIWVjK7B/IXvurZYsVS0QnfzLP
	 Rx7Y+8CIwNEI1eUIV3vZFsQ6wZxG7Amgwe9BoWC3hinMbltbxxNS3vGZlHd6P2YRh3
	 dfORjBZO/mxnMBh4e2aD+ZrRLEG3/CKhVXWGQjgh3z4VTsuzD172idPQ3ajkufxzMw
	 ZdXPgq3Gxyo0g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2B1B740425;
	Sun, 25 Jan 2026 15:16:39 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: john ashrith6 <johnashrith6@gmail.com>, workflows@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] docs: clarify CC list guidance wording
In-Reply-To: <CABoKZAAdwO=pm1-GsP=09PkCGs5HT8K=1Y72LJvKCRUFJD38JQ@mail.gmail.com>
References: <CABoKZAAdwO=pm1-GsP=09PkCGs5HT8K=1Y72LJvKCRUFJD38JQ@mail.gmail.com>
Date: Sun, 25 Jan 2026 08:16:38 -0700
Message-ID: <87ikcpen8p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

john ashrith6 <johnashrith6@gmail.com> writes:

> Removed the extra Signed-off-by so that only my real name remains.
>
> Thanks for the review.
>
>         From ed7f4bb8c6e46f76c1a02e91172402b7389ecb5d Mon Sep 17 00:00:00 2001
> From: John Ashrith <johnashrith6@gmail.com>
> Date: Sun, 25 Jan 2026 14:48:28 +0000
> Subject: [PATCH] docs: clarify CC list guidance wording

The above stuff still needs to not be in the changelog body.

Also ... as long as you send HTML mail you will not reach the lists.
Please work on sending to yourself until you get something that comes
through correctly.

> Signed-off-by: John Ashrith <johnashrith6@gmail.com>
> ---
>  Documentation/process/howto.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/process/howto.rst b/Documentation/process/howto.rst
> index 9438e03d6..5a29111d6 100644
> --- a/Documentation/process/howto.rst
> +++ b/Documentation/process/howto.rst
> @@ -403,7 +403,7 @@ interacting with the list (or any list):
>
>  If multiple people respond to your mail, the CC: list of recipients may
>  get pretty large. Don't remove anybody from the CC: list without a good
> -reason, or don't reply only to the list address. Get used to receiving the
> +reason, and don't reply only to the list address. Get used to receiving the
>  mail twice, one from the sender and the one from the list, and don't try

The change itself looks fine.

Thanks,

jon
