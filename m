Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADD98C0E
	for <workflows@vger.kernel.org>; Wed, 25 Jun 2025 08:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750841363; cv=none; b=iwQPb+/g+hR+yHn84VY77yxTBnvp5I3XokPoKHMXQPqjdk7bjcCfRuaDT6evinY+h1POGNSQgxZhtEADeDC4R3UM5dAzgvf/+OL1Qz0Xz1mXZrLzi7UvBA1VoYnKsR/JqL3Y7pkn/SBWZE3Z+I+omCZr+ENGffHL/MvF/ufSvco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750841363; c=relaxed/simple;
	bh=nvqiVYP05gkX+45rgrHxV9tn7/eugPV0r4GU2p4dxOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+rJWlBg6xZamqiSKOpqs2Ewsx3LRV2CFA/xII0P9gD4TEUEDaMAED/0r1v1R5jYENB8gyHxYin7tbEiAsBts46ou00bFm/t0xvoeXaig5ukSCiL6O6a2QzXk73pcmQr532DE+TOI09fSX10O4uJleOCemP3CkD8UE8xn4RReXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rB4k84ZB; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rB4k84ZB"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553e5df44f8so4790071e87.3
        for <workflows@vger.kernel.org>; Wed, 25 Jun 2025 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750841360; x=1751446160; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nvqiVYP05gkX+45rgrHxV9tn7/eugPV0r4GU2p4dxOo=;
        b=rB4k84ZBTiQuHqnZzWMlBeIhSbnPol3w6We6JJyc6A36GIsVpwN9sLH0SbFOuLRFoP
         UW6nlTRyXiTO8E5M6L054uwBsnFulRn3F/ElMHYGEqf0EFSLUkko4pxjOZ6aXeaDVgh2
         zTLmGMkaevW9ua2NK7cVfItN8iPbj7pLldaFDSZki7KkE2eHvFlUipNH3vDLL98x7v9n
         ntAKlx9Pawb9eDUQYG5Q3fdIQv7UvDEyUybXClkyOk7HShEOOit42nBzABH4yNncWrFt
         aYGOk1w/U8HspIveNqEbLm0kHBLkM7p407FX8p/U8exeb2NQytEbMRNX9Xt2D4qKJ1iO
         h+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750841360; x=1751446160;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nvqiVYP05gkX+45rgrHxV9tn7/eugPV0r4GU2p4dxOo=;
        b=m0RwMgPfoC3YbAEyHP+coFCCCSL5UeWvfD/95o+/QrNZhqSpD+eSDoK0za6vnONolT
         +6J3xqfPDYTLB+ZI0EaPdoMYMX7GR4/mlalVM52r0aLYyzCG4SD+Av47HsiW/VPi9AED
         QTRy2cp9HxNM19tvRAKDIm+2y27zwkcX4ME4wVFV1ugay/RkTTbemE65MPWKSJXf/ke0
         OoZMd4W5odFNyw5BCSt82FvFMmC+wQ1kbg18AqUFPpFOBMyBTJUG/9zyPRKTm980QJkw
         +4+KTW2dJ0uH/wPXSyIEuYikJAGc+DjEc47OmOdFmRYYfJG3aLMuFq/YRZjLl/YzZenA
         wlCA==
X-Forwarded-Encrypted: i=1; AJvYcCV9wtOeME3RsTbh709+PE1LUamz29kZ9l/yRR3juBJv7LT2dNCmcaPxPXmshjVRuDvyS4FLuJs0XSs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyeom02AvY+BxyVgRNmDIqhpOf2ZhNOSqgWO6esSM4wmq7o9sfj
	91EctR1jsY7rTEWJdAgSBXi/312OCOllLfjNJfhNwhQinLUixu70k6Oxu8cBm84ddTSu+e7w85e
	hQ73gTY+wzCKaxQZwHV6oHBFRUKG73Pcnp+Qr+M9x
X-Gm-Gg: ASbGncvGUlQ8gDxJVScoK/H9uqLP7FWmi1MZHZaC618s1VEaRwIOSM1px8CS0tybLyL
	/Sgfa50fvSQTHgHwO6hJxYlTwHY6art1IEcbmarQDfG7ctaPw1+Youks0kj2Lnz1ddxiXk03T0P
	2Krw7mQUQ0Q3hlzxQsGZJh4FpAEATPXbSEz+Ms9MNldC7QZi5Wil7sycuxBW8XmqByf0q0vvTq5
	CkT
X-Google-Smtp-Source: AGHT+IH4sD/iS/Fz3AfqY3JjQJ0QSUCwWLiwTVvoLWsrtxEtv0ZKRiY1/QvBZtg02yo3iOHVwYxluGoF+g3P5vNH4Zk=
X-Received: by 2002:a05:6512:334b:b0:553:288e:149 with SMTP id
 2adb3069b0e04-554fdd1b64cmr554545e87.27.1750841359942; Wed, 25 Jun 2025
 01:49:19 -0700 (PDT)
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
Date: Wed, 25 Jun 2025 10:49:08 +0200
X-Gm-Features: Ac12FXxVCyTc9FCprJeDUTUo0n_vww4UVwL3_j6F7uN0V-VcezTdw6FnkszO8VA
Message-ID: <CACT4Y+Y_RQX55fNTLAjEQJYp3TY5a1yYZjx42BYu=vfObWzTBQ@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:

> >3. To reduce duplication we could use more type information, e.g. I was always
> >frustrated that close is just:
> >
> >SYSCALL_DEFINE1(close, unsigned int, fd)
> >
> >whereas if we would do:
> >
> >typedef int fd_t;
> >SYSCALL_DEFINE1(close, fd_t, fd)
> >
> >then all semantic info about the arg is already in the code.
>
> Yup. It would also be great if we completely drop the SYSCALL_DEFINE()
> part and have it be automatically generated by the spec itself, but I
> couldn't wrap my head around doing this in C macro just yet.

At some point I was looking at boost.pp library as the source of info
on how to do things. It provides a set of containers and algorithms on
them:
https://www.boost.org/doc/libs/latest/libs/preprocessor/doc/index.html

Sequences may be the most appealing b/c they support variable number
of elements, and don't need specifying number of elements explicitly:
https://www.boost.org/doc/libs/latest/libs/preprocessor/doc/data/sequences.html
A sequence then allows generating multiple things from it using
foreach over elements.
