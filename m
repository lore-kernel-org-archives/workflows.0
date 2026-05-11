Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8154A3415;
	Mon, 11 May 2026 18:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778524774; cv=none; b=jh563Anye6l+YLIg8L38FxzcQ9RqTTK89C48hKSKEgtLusPSAyCzzlUO3zd450+ua2ebd+ia5jEJ4fs6UlCCz8giorscswSdpE4KCAb5Pzheckg4pWhSNk8qUq8sBUKhUXO3uI+ON/IkaSplWoPzMeCvoo3aPBAnDS06XR6bq9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778524774; c=relaxed/simple;
	bh=YEW525F5sOHLLK/9VU0cyRAI9ZIyE78/XBdextCq/fs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sGSeEpkxuN00UxAMle1+uGP5c5IzB9Fu7PcTtoMtxXl8co0G7PL3wGZDIsJmVEFs3rDxdf298dCH8kBvNCLU7LbgjAo0MJKD9wOv8svbC/WZrooUDuUkyZvRn3rDNTqeLpwM6dpuiGvSt26wddl7WVHftS0uuHVX4fdJrGGJdAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=pSfrr8ZR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="pSfrr8ZR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 13B5541098
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778524761; bh=97X9Fu4OJjVAdmLKpepm6oiTmhDLbfYTxb3VSpfZSJw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pSfrr8ZRA38bYOnefHqDsvBMFzT0PlB97EMDdl3k3goTtUdo9xIKg9lEJuVVsYFL4
	 W/xItA+yY4c4I/gpD3kS9PBvUlrPK1hCAR5q5YIJFbtzq1eHdnSXJAgXPckcTJaH1y
	 8vuOd90T+SH/xzjyKC1kNwkI3vXRvYzf5j9r1F2Td35tGBkSs67rysoiH3eP+xiTDI
	 Kr80hff+3zikdOVOa3ql98KbyqrKK3W8qxyN1KlZUytdxoxYJF/Co3QcYvTaI/zS5/
	 TGvICqqoOUZYSKdn2Y7xzTmOpTg1uxkw8AwydRfdqK27SQ2lwqF0JxmJXgkKQUmeqF
	 MlT2M2Jt8JW/A==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 13B5541098;
	Mon, 11 May 2026 18:39:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Willy Tarreau <w@1wt.eu>, Greg KH <greg@kroah.com>
Cc: Leon Romanovsky <leon@kernel.org>, skhan@linuxfoundation.org,
 security@kernel.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: security-bugs: explain what is
 and is not a security bug
In-Reply-To: <agIZ8zeg3m0xE3yL@1wt.eu>
References: <20260509094755.2838-1-w@1wt.eu>
 <20260509094755.2838-3-w@1wt.eu> <2026051124-afar-renewal-795c@gregkh>
 <agIZ8zeg3m0xE3yL@1wt.eu>
Date: Mon, 11 May 2026 12:39:20 -0600
Message-ID: <878q9pvlif.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Willy Tarreau <w@1wt.eu> writes:

>> 
>> Looks great, thank you!
>> 
>> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>> 
>> Want me to take it through one of my trees now to get it to Linus this
>> week, or should it go through the documentation tree?  Either is fine
>> with me.
>
> Yes, please take it as usual, it's simpler for me and it will likely
> allow it to be published ealier, which ultimately should help us
> faster ;-)

I can ship stuff Linusward quickly too... :)  But it's fine if Greg
takes it, of course.

jon
