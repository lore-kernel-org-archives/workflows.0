Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF77327FD7C
	for <workflows@vger.kernel.org>; Wed, 25 Jun 2025 08:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841780; cv=none; b=FooTwIoOJ6XJObAMhRW/z7eJPpetWji2vEedKpW6ywRL1MqY791W8uAhrAyOfrhryaHsHwukFWMXrbj6JcBEWbYISPDClZdw45j75PLVVRwarQnxpVkZFtQNj77H3b1qh0DFgGI1Fo+n+5OhpCBpK4/CoNyQx1GlZhRIQngRHuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841780; c=relaxed/simple;
	bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z56UXzuE36vIT2sgrhmgqBPXwkoVkjzNn7D50GuS1RNN0Q86Pw43vpErLLeyG5dpcQ8rB5aSdpdNBazwFmj/mHWfUM9SQQ83NRIrl7fXYnVogmp5JKZSU6OOjXGghc/dv48VnneSXelvMIOqvxJWL8f3ECeWHsFaGtsm5hpED7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=op7eE2Zs; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="op7eE2Zs"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b2f5d91c8so47731071fa.0
        for <workflows@vger.kernel.org>; Wed, 25 Jun 2025 01:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841776; x=1751446576; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
        b=op7eE2ZserNuvP4n+qRg601caRgmSUFYOiJfvSqdH9Q3uUnh4tTL6C9KwiwaKq3R6+
         5cbdaWLIEazToB0nDTwb4V2rBPDAXNR0h6VtOVq4YZnxPOqhb7xk4BCb2At4K3FjQHDf
         vZhclGWu6AMbMEmzOBPbCJ5o7dOUpcMHi2wlad+6oE5l+HM6GtDfH8vjtJn2BXGK18vI
         +5lt2kykNH0znZ20fnOttuGuUPwZ6/ZkqZMYbg69uzt0OkBtqN/4wjvzfd6DyTXUASbQ
         6XlOKxAeu+Nq4fELwwmTLCnSyXrusKZ+4rmWcAdiYCMrXv1xIZ+T9d7g4KVIOwIMm8yJ
         4Pdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841776; x=1751446576;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ol6hG/xIb5bYbNO2SBhx7LVEvxidce1MZgkT1Tx5R7U=;
        b=CK8+4wLtP9Lghr/LOJIQdYYtRpIJb2QBkFDKNNwNNHsJ4eNimhaEOirQxmnOTZPvUD
         GSjqVaC4Fmo+Jp53Bw9dTTD0W7Mi52kMfplVfFDHQSq+cUuPo3qedGYQmeMjHaobtS6F
         K7hnd9i442rvgGqJOpUCwhDa4Apq+qdC+5sC6KMWaMM1HSQEQs60XxT5ghKcnvzLYRUL
         1N68E+CC2h5LZETjyvg5Lk2yA2e/up4Txzjotqb1QkFA63q6zFOpCGt3oK4wDehn7lnd
         milhsRIXRDMmnX3YBRk19GSYOQxTiOMVkMAOBRSvomZy0RLg1FfXhtBzj7GpkVmtgI9N
         QShg==
X-Forwarded-Encrypted: i=1; AJvYcCW2cLzKPKP4hG7eL9wRF5Q4Ijx9p4ynsAZIkQsC62Tj3cWfD5V2V7FH1FuNoO5134xXpqWtkzWGSqk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+wllwCjY9INAppkSkC4oSuaoFqIup7tSyj/9gTfjnrurFVXrd
	P8Rz63A6RkpGjn7wuTKQmaiCkhkc/JBUzoDTj7g4UOX3BczPBR99un4nZrIoZQ5oG3GtHgdHMER
	9LZwQD8cLc6/oSTDWNUbCRImRuYlSr9A8TveWBotm
X-Gm-Gg: ASbGncsdeQNUoeTdWnPXWG1iQk42riKPAHiWcb9XDL8NpqUKrBeQHtd612YlvFXBTV5
	nc/7dP1bmtobc7QT1PtsU1uX2Ompu78SV7bNF7iGHWYrNn4+P9UCGMHs+nOs6cEXVEhUEf6dMmE
	M9reMZokUGKj2U/AJweVR6ylNKwgBegFdAjh7UOL4tHC2FharRO6VxGSUVCxi0W2WChiNfALvKC
	D1L
X-Google-Smtp-Source: AGHT+IFpgMsBCJNfJjNTqTcRqyvaAq9toiC+ROW42NXwQoaO1HLVScBehwrjaxIyE7j0rk+vG9CVwK1uxS5kBraTZEY=
X-Received: by 2002:a2e:8a90:0:b0:32c:bc69:e91d with SMTP id
 38308e7fff4ca-32cc6591e04mr3745431fa.39.1750841775748; Wed, 25 Jun 2025
 01:56:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy>
In-Reply-To: <aFsE0ogdbKupvt7o@lappy>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 25 Jun 2025 10:56:04 +0200
X-Gm-Features: Ac12FXwcV14oy7Lg0QTHJjjjHfOFa5hONjjoyvSSHa4vsJdvjxnzlzXvHlNTG4A
Message-ID: <CACT4Y+bV-3HgNOAd+f7W0RBU2-qoocpMCepKhLEb+BcyiJM5Mg@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> >9. I see that syscalls and ioctls say:
> >KAPI_CONTEXT(KAPI_CTX_PROCESS | KAPI_CTX_SLEEPABLE)
> >Can't we make this implicit? Are there any other options?
>
> Maybe? I wasn't sure how we'd describe somthing like getpid() which
> isn't supposed to sleep.
>
> >Similarly an ioctl description says it releases a mutex (.released = true,),
> >all ioctls/syscalls must release all acquired mutexes, no?
> >Generally, the less verbose the descriptions are, the higher chances of their survival.
> >+Marco also works static compiler-enforced lock checking annotations,
> >I wonder if they can be used to describe this in a more useful way.
>
> I was thinking about stuff like futex or flock which can return with a
> lock back to userspace.

I see, this makes sense. Then I would go with explicitly specifying
rare uncommon cases instead, and require 99% of common cases be the
default that does not require saying anything.

E.g. KAPI_CTX_NON_SLEEPABLE, .not_released = true.

KAPI_CTX_NON_SLEEPABLE looks useful, since it allows easy validation:
set current flag, and BUG on any attempt to sleep when the flag is set
(lockdep probably already has required pieces for this).
