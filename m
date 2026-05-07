Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DCC3EC2F5
	for <workflows@vger.kernel.org>; Thu,  7 May 2026 15:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778168272; cv=none; b=RTtXpW8hOQX1dEX70aYOvl4YiTSsdM6fyAqufHurfvjAn6wrXyqmF3U47zWvOYnXIQPluGEZQ9stjyftgjAzk+9uRNa3ahYcD/baRQcd+TX66PuRR8jfv+fsjFJmgiFm9PruXwigIaruBRns2t0ajl0e0e7/mXe2O/DjzUS6FE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778168272; c=relaxed/simple;
	bh=4z1LA7620U3bIFCQ0fVra8G03PXRuuNdedi4Umdt+x8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OvbtdoZ3ZYmxyGfym+M7p7LdTF3JXPSsRcN5g8EDfAS2VcRcU6EjBfMSRDh/DMkqBpvBu8OoCdfzz9somQwoTq7zEBoDKJzM8tjQAcDq5wFUM6k+/AOqiBG3rZdDFIrDbziovoJPX6oG7xzueFXsdUFTiVDYeYnXkj0BcqUMeD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=AWCD9LTe; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="AWCD9LTe"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-bb91b426e40so167010666b.0
        for <workflows@vger.kernel.org>; Thu, 07 May 2026 08:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778168268; x=1778773068; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3SFbYQj7gvmgabkGYv4xpzYjp9xPOKffoC2RtE/vgGY=;
        b=AWCD9LTe3lqVOcNfIo+3qfu9JFUhEI+5DJR7rbcT7WRiUOE5TIThQzbFJEXvbXnx4o
         Yo/qCz/edBoZWfQQaDqiZkesDQTmbi/d/N1m1pDA4+Y3HcQUW/3N7Ev2U6l1f9myQPOb
         2nbsmmmEv+/N7oglHUvGKGpSyk0/y2a1ttQ1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778168268; x=1778773068;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3SFbYQj7gvmgabkGYv4xpzYjp9xPOKffoC2RtE/vgGY=;
        b=YNCVzzNmrmE3uuCk/mCRsmRxvR0jD12lzKCqXjbYWoBVBWOMa5ott+hy2OI1MqsE8a
         9O8peVB2QJqgPNMyDowMZocZPjikOOobxSB2kFJCMWfivAsfY8ghb/ivoskNmA0AMwSq
         BKWnI+c5fqAfgvjB4xbl8y12nO4fCF+MT1gbtTdKsRP6ItTuGXIqy5RFfOF52VpXYVOi
         ThTBMZvZ/Q5SUAMQg+sFTh7j7SEjfAJID0mrE3tcnAyBdleMA9gTIrQBUqWdeUyyH6NV
         VebU3B5y3c21vWDjJYHp4/8fmK1lbfheYK0RFX35neuSSXSLsKweW/TBalRjNcPZojSF
         g32w==
X-Forwarded-Encrypted: i=1; AFNElJ/uPq/3L+HBR3JQ8N+LJSYp/+Su9Yaxsr/aayTjByLMV2uPdVPiB1x/xtdsgFA4p9YNtO6nq5F4z0Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT/llASsNZ5mYCHbvpioGRtaWhcoptOCK9b0jKg0Uy6WU8lTi/
	IalqmxLJlZYEiexs1DPTC3Ny4mKJc++3YQMN5Iquhp1jYpBwJQPQxfXBl8O6taOXtTGzlGRbp3L
	EPUjgA6E=
X-Gm-Gg: AeBDies/HPHiCn+wxhoms4OPUm8gV3QjeDolueQ6VrCO3qgXcwlJ9wJ1/LGbzJZ9lBt
	v1PLUKEfKsC1L+W+E1qlRUqjY0ze5fslh7/6bs/xyA1Qdvfv/Cm5EbnwxmwbDwzjNWa+lYRrix0
	o1j8Fla7oQZqcUfiYPIuvgrh80bGQ0qK9USepgRBu5f+8tsXHhmMUvdVEHsJws01Eet32cfbVCd
	Hp1s5uInnMeBp0BqMq3MoUVsAhPOWfqIpn4N/wpsGNtyxqJilou/2+zVcF3KdInN7RbLgALtO+w
	7u8jh5SlLti9QVdKHNqKJOcauxzB+T5/nslL1fESqiOAUyHTWXv4G8W0HOaytvbScrey8Ge+iCT
	pclo/OvotmX4rt660gjM6qrnIEL1TIGgnAt3foXSrVxcdUVdr7bWJPke7kn/6LgtMuBy/ZYw2sj
	DZn4hkLnCZW1WOab6/gvg20W5WelZ1lFGOKvOX+a+tPCj4+GlnkwnKp3We7Cx0IFBEsEx8OTp/Y
	ktmdZU2fQ==
X-Received: by 2002:a17:907:fdcb:b0:b9d:3e5e:fd32 with SMTP id a640c23a62f3a-bc56a6498c3mr504699066b.8.1778168268144;
        Thu, 07 May 2026 08:37:48 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bca53dd7034sm2468466b.3.2026.05.07.08.37.46
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 08:37:46 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bb91b426e40so166999866b.0
        for <workflows@vger.kernel.org>; Thu, 07 May 2026 08:37:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9D5Itcdmul0nXBZu+jbDUWp1lIzJrOMolsDBWGg1hY4nCl6a+5S9GeqCEYZna4IcD/PypM2dxjzzo=@vger.kernel.org
X-Received: by 2002:a17:907:3e8c:b0:bc2:b202:eaf3 with SMTP id
 a640c23a62f3a-bc56a6493c1mr490879266b.4.1778168265932; Thu, 07 May 2026
 08:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260503113506.5710-1-w@1wt.eu> <20260503113506.5710-3-w@1wt.eu>
 <CAHk-=wi6z5BGUUT2p+=qrJg+obom8VnCo3MqB=7xp3Gw+UMMkg@mail.gmail.com>
 <aftmB435XJ8FP3V_@1wt.eu> <20260507070720.GG3126523@noisy.programming.kicks-ass.net>
In-Reply-To: <20260507070720.GG3126523@noisy.programming.kicks-ass.net>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 7 May 2026 08:37:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=whE=rLLbBRsFuQKVX49NgN2UUdUE=Druf3fiSZ9Ou8c3Q@mail.gmail.com>
X-Gm-Features: AVHnY4It7F_ZiVU3gWouldUT6m56NTwQHgBU0JJIDr0fU-oIC_OgJy_afcjmuto
Message-ID: <CAHk-=whE=rLLbBRsFuQKVX49NgN2UUdUE=Druf3fiSZ9Ou8c3Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation: security-bugs: explain what is and
 is not a security bug
To: Peter Zijlstra <peterz@infradead.org>
Cc: Willy Tarreau <w@1wt.eu>, greg@kroah.com, leon@kernel.org, security@kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, skhan@linuxfoundation.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 May 2026 at 00:07, Peter Zijlstra <peterz@infradead.org> wrote:
>
> Perhaps also note that including a reproducer for a crash in public is
> fine, including a full blown exploit is not.
>
> So perhaps that can serve as a guide

That would be a good rule, I think - and I like how it has the
advantage of being very explicit and black-and-white, rather than some
"I think my bug is so important that it should be sent to the speshul
super-sikret list".

Because we all think we are special. Our mothers told us so, and even
the AI bots are typically explicitly told to act as experts. So they
think they are special too.

              Linus
