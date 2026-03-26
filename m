Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B710C31ED93
	for <workflows@vger.kernel.org>; Thu, 26 Mar 2026 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774567152; cv=none; b=dD9svhnrkRbQ27Ch3HZSUEJoL49p+kzvZcH946Pps+9+58wVxlmrZRA/JFHlTymhPs6KWFHSbOnSeDi0ld5J7PhdLE06Md8u04NO54wDI6d7bA/IHvrqvRoRTgDjPVKCOPzLfqgfv4EgadSdElVIYKGJani5RGf1R/133K8MOQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774567152; c=relaxed/simple;
	bh=X0Me/dNUi1Q+mcBQys26ogIjAtPJH3qu7jwMW1opn38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKrY4UHslB8UWfWdYEHSiERuhMl8TIDcNdSt3yof2X1XHvwufHL6DfRk8ppu1KSMfb8+I/WC/aL7FAFvE5PkFO62zZZJJFb1weECpmwBOZDRaNy0u/orSi0IFaSFBLIW9aJ/ETl6fNALxCEL9JSJJWeCutc3bnKE3bDBbOzDB5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJl3p8TI; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJl3p8TI"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12a74039dc6so1293853c88.0
        for <workflows@vger.kernel.org>; Thu, 26 Mar 2026 16:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774567151; x=1775171951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aND1sIzVOhnEEepy+yl6cKYN4PM5Ggk917eNAz1qw1E=;
        b=tJl3p8TIbHqcxZCrf9HCipNbffEPIeQP7ntZOi0Zm2f7SW/3FCHr3Cv7/PxXCOLTTn
         VfxBsYpyDwRFskIJ69ppQDZNnKArHJF1mfeA3A80kELGJYXrFmGflUNCowx6FMiv+Ckf
         GsPS/mUyIWZWC8QPiB0TEA4K+ybSVzjtiuiJNTKRtY02vtE5oJykisOOu2Agt+pvZ8rI
         Srgmmn2XMOGYyPSvwuXtWJh2Nx0ckr1I44vL5QNWYgrXX0SgvUN528CVsHeiwGkPXw7e
         QcIiIhIubF0h2NOcQ3OjoIAlfKqWu+QLqc6lwi4uzL2Ei5bmzc0Lf3OSEDHu3i8MPCka
         i8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774567151; x=1775171951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aND1sIzVOhnEEepy+yl6cKYN4PM5Ggk917eNAz1qw1E=;
        b=LE9U1XFEEnDD0f77umh9eKLXuXYPDP0Zj0BzBJgp9ak+TTD8tle+zgSVxMqnaoZnD5
         tnFsSBPR0zmIvfiE+4uot5aPEfNqM/4YKvCoWYxPZY94Mx5TR1QLa8d6b6MS4hHCsaBK
         VQkfrgqRgZ6brDAwpw6einDMx7v3PU+98GibLOgxHOOWBPuErV+dbTOOD9nmsYCUxwpm
         P5igui6UmB2WpQJ0qBq74AuomwTbZD53kDsOQmPvPHHLgccwjY4vn2EJPKHX8PuU3i3S
         h1b9ypCPi2pPKsjvJ3dColAbw4gmpNRbUbctAlBK6KibDfAMiJhC2ehzRxA2qsTjsj4o
         ZZvg==
X-Forwarded-Encrypted: i=1; AJvYcCWmaxxni124KfuI2MzFLyE+woyt9GPcX7iVnc9gD7/vdz1jZ2BAZRir9aGktwIT9mW4vo+puKmT4oo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2OXNFKqIrRYMV7cJjAK2lTjJmuhTfTHvA5q82/pTczdhQ5inm
	bZjyMyViGOZgqnhCU0Dy7x9y1Dtc8b2GWha/xBgqfo04WVkRAEdumoik
X-Gm-Gg: ATEYQzxVfmgAjdsB5vkXuHYD4x+UAf8awoeHybAxVZs1HpR8GuBY8Walah7zwr82eX9
	GkwgHdx/bCcTaicqaaF9vU3S+NcU0rd2VApjeOuTqf07rst/OTdONYYU3t3Z2TTxEVbss9udxBX
	TsvMyBCe0Wl6KZULJFUOwr6SpBo6PZ77KEZhSxcbXW49HD2gpCi7CMHTaUS1hV5s8Wop+zjLUa2
	nI3GT1cADIkpZzlq7pnv8quhqsl6eh9Vf7cSCCIJ/74qXFJMa6DjROeC267TNJqpyZIbaWg3QD6
	qh6w9ChaW2xainiHFz28FOHVBTpxxCmqeqPnAKD9fhrXnIeuq5be/IU4uXP/kdn7M9xWaUsx71w
	Mz3VgFoP5ihDgTc9SntBk/TiRvtYFoS7fu/QzU8fd0mDrmw4oAC9UhfMuDQ0hxmvWPIQezXm3Dt
	oiwZu0w9mg1vRzxrxM1UtnxWfmNh2jTywzeXnY6njgc2693q9COQdW5E+DvK8Frren
X-Received: by 2002:a05:7022:6183:b0:119:e56b:989b with SMTP id a92af1059eb24-12ab283c9fbmr263185c88.2.1774567150716;
        Thu, 26 Mar 2026 16:19:10 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:c497:6d9d:a11e:c553])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa7827e02sm6040198c88.12.2026.03.26.16.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 16:19:10 -0700 (PDT)
Date: Thu, 26 Mar 2026 16:19:07 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Joe Perches <joe@perches.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, 
	Lukas Bulwahn <lukas.bulwahn@gmail.com>, Andy Whitcroft <apw@canonical.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] checkpatch: allow correctly handle full files on stdin
Message-ID: <acW9KGbNm8bLg-cr@google.com>
References: <acTPXMJfkHLeItrK@google.com>
 <bb47800754aa3279e88c9d88c380bcfe6263fb2d.camel@perches.com>
 <acVIBseRrqJI8Uwb@google.com>
 <117b6a4c164a9f0ce348044152d00ac22b31b81b.camel@perches.com>
 <acWnbG3nGjfYeYXh@google.com>
 <34318752a257b0f6b530eacf53d565de1ac84485.camel@perches.com>
 <acW6Iar6XOzO9IfN@google.com>
 <3217a61e50f7b9fd387b908c0907bd0bf889bebb.camel@perches.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3217a61e50f7b9fd387b908c0907bd0bf889bebb.camel@perches.com>

On Thu, Mar 26, 2026 at 04:10:05PM -0700, Joe Perches wrote:
> On Thu, 2026-03-26 at 16:04 -0700, Dmitry Torokhov wrote:
> > On Thu, Mar 26, 2026 at 03:56:27PM -0700, Joe Perches wrote:
> > > I gave you feedback.  You elided it.
> > Could you please point me to it? All I saw is "just save it"
> 
> Seems constructive to me.

As constructive as "You're holding it wrong". I want to be able to run
checkpatch as I am typing, not at some later time. My editor shows
diagnostics as a virtual text, so it is quite confusing that the error
is still shown even after I fixed the issue.

It looks like I forgot to add akpm to CC, let me add him...

Thanks.

-- 
Dmitry
