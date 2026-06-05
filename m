Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0607A3CB8EB
	for <workflows@vger.kernel.org>; Fri,  5 Jun 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676488; cv=pass; b=iUTr1u60MS8OSIuoPCofjN65S/JaxT5r5jmg9tAYCsy15sczmTT5n7aTHJyYmA76iXgNsnFyPlOgRoGtyl8kWl1WuSHGrS1CybUrAxO8SvWVHgBdY4l/kbkAiBpnPzTBi0pXyZj1HbmcN8bK/OYppj1LuBOzi0I0rdPRFdjBN70=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676488; c=relaxed/simple;
	bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgTr9Ht8oJOraASsWeAXeaqWoeQbUGB1xqq8eRc7JRxxPNCmT8TTBSQGcK2h5A6+wTF11j/EWWungcfy+NA44ZPL2MCzjdOTRkphrnqjoTFgpno4WIQ5HeS3P7jt+CrBgzPxBGnQ7k3VV6xCa8+OndBvLmMBJb4AVprRciAjbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ui8wUur8; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ui8wUur8"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6611689dc10so118923d50.1
        for <workflows@vger.kernel.org>; Fri, 05 Jun 2026 09:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676486; cv=none;
        d=google.com; s=arc-20240605;
        b=TkPAAW0VG4adMakRs6CnltbJYEQtOaVvBtxAxowNnN5i5K6NgPqNKJMgICM8t63xMH
         6KSLDeVz/w4j4TPxI4LKnbEv7PfjpRt1z0DTeZAxOFnZl8KORBuHxLbHZ7VTkyT1hzAo
         Jbbyl5imlaWKNNiCD9n1hW14Ef4QGFvxxa8j/ALTobYg/j7CZFhiCvdiT2gtpKh1T++l
         3f9WlCHrBpqTkSCOl7Q/BPqUtozIIdrjmJTrLovulOrc9Weu23QGtESeJjAHg5CvFuxW
         jNc0xSuU2K8yMAQfY/+9At9P8QCTsKZBUFNFcxBzDV79mrx2hhS9VyG3bYM1v+tUmk35
         xMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        fh=mPo/8mzDXrl0bZdQqS3X4c5/e/4uZ1Hf4fHOVJS/Hgo=;
        b=KSAOucHTsr09U0wPNO88WPr5Co4IEeuzYboxOhbenir29xJKpxYQbYg6Hlb/rj44yx
         SwhTnKUBRfxXz+G9E019an90s2JjaNiWo+h95bOZ8SdCr4mWyke2Hgw1W1mez7gQ+FW1
         atX5NuqH61EsMGRGWd7EDUQ+ZrFwgSB8cf1gdj7W4ykFrxXA5/l7F7ndXIiYZ1/Xe9ip
         9MChk0YNhrhJ13AXNYEAi+/oraTQiC0aCFQJmnY2agGgMDq+CGOdOd5IZQC/j7H3IpAH
         ijuTtOSdnR9zBWl+3BXKJwhhn5RAsnk6Hjwf4eOrkePVMYtRc0gQb4Ky8ZgnMbdZYQu2
         aL+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780676486; x=1781281286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=Ui8wUur8KSyN0pvynRn3skezHBd3sfh1W5TIjT4eVt8Ktiz8vrwisyKkScL5uRWs83
         GBDkw6QrKOQy7eVUQZoCJWF5kgJ9MUu2mbMLhq6GgQOCJWyTwgqUwp3kwBc1JF6hg0cY
         AVaO6PI9zVJGkoVY23ra2X+Pshx9zPmheAZP3Vgy5eNnT59Is8pWFvrufHHr7ADCbIan
         N1LnZ2808X83NOKNBnd2eL5qBX97ba92cAY2Qh3rEEM5SzBPlKMWOzrojBQau6ULIAiL
         fq+cXcJbuJiw+OekQSmQwaeYvzjLb5tD7/ywY9GJ8ni0M44MdhHBiNzPnzL2umckP+rC
         RWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676486; x=1781281286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=rNXGJvptqsJ1sxoCe8XPOIiF1czYb7iUFC8cr7e9SeOUq9/UyNgImY742gey6H867D
         5Xcd/IaezS6Gq8R3ukzUVNJUXU+5ocraptFxbImqMJFqp6+I7oS/FNNhMkJNEaaTxvNB
         XylXGxS6yvrVU5ZuYPfDYdbT5PoTlmM7csWhQw8u4LbYy75cDLgy6ziFQ+Q3StWrk93X
         V0vlTWvEYy5T0QJOuR9I5q39NP3zkNf/h9grvMKteobIFqg7Mx6xbCxNPdr4+oDk+jtT
         m8IH0SkT6zffDmIk1fMILOa7KP7Vbr5VC0BUIP3rO+G9yHS8c4lqmzx3iboqXRMXGz6z
         bQSQ==
X-Forwarded-Encrypted: i=1; AFNElJ8b7aNGR7UnC3PCjElfB8y3Bh6dMbpy9eWMMJV8C1wA35f7HpAp6I1zpbiJMgBxmlFJ5J0sDsBd1KA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfNdYujAN5ZFf+CCxH9GwFmXbhVVKlEQCrGWHk8MYMWNPU2Ezd
	88pxMCVdZEVcj7+V8UpIgDovt+DtmsWwioq2DnFt54P61SunV6NEDQl2tGQkztJ7uTObVJqDamK
	vtiG2GHulaue0mi7bbaZLNraii44/xgntE4aHmqcC
X-Gm-Gg: Acq92OG9xwq3ORrvUQi7iM+Zc7uQ3OIEcchfTsuu65pM5LSlFb4TaXjAv22MCFk4Pk0
	ckit0PL+46SgFeIgWsidkQ0LX3vSmDMNmmR1TWsgeZahZKzl2/PVSyFzjv6pWrCBbYimopeBrs6
	TvPMSyaK9fpOYFNXzMvj5be9BvYw/Df7jqVSkldzseBqEAe3fTNaAZwHOkiWUGaNWn9Zk3NMl1E
	lQPN3xoD+tg/V88UO1YeailbSek9OQsaMD5LMYUx1zk+Z1MNoZKH5mmxVjhr4dKcFaEsEtI9wkc
	asJVQ3DU91RTS1YrJwJS7GFHxXQG0GzuZFIkGlFNQuYiPwDovTc=
X-Received: by 2002:a05:690e:1388:b0:660:877f:a5f5 with SMTP id
 956f58d0204a3-6610704f8f0mr3897550d50.43.1780676485426; Fri, 05 Jun 2026
 09:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:20:43 +0200
X-Gm-Features: AVVi8Cev4P7AiBmPodWfwaPtX8_k3m47tFa_rHl6t21z7L5L4Qmm-6Ly0xXbR54
Message-ID: <CAG_fn=W1++qPJWQk1+4MtRfe6n1iUKF2O5pddnqKGwSq85CuqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Introduces a new KCOV exetened feature that captures function arguments a=
nd
> return values at kernel function boundaries, enabling per-process visibil=
ity
> into runtime dataflow.

Some high-level comments:
- Make sure your code can run on every platform supported by kcov (namely A=
RM64)
- Check out Sashiko findings:
https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fe=
e0939de2c4%40est.tech,
at least some of them seem to make sense
- Please consolidate changes to the same file into a single patch
- There seem to be two tools (one in C and one in Python) with
overlapping functionality, can you keep only one?
- The test modules seem to be used only in manual testing. Can you
convert them to kselftests or remove them?
- At this point, long dashes in the kernel codebase are quite rare,
and I don't see a reason to add more.
