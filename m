Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE6520ADE7
	for <workflows@vger.kernel.org>; Fri, 10 Jan 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736511402; cv=none; b=m629KIJG+2FYHzOT133EsvYVH9noq6Ec3qwLyGP4A2ibCV1+/tPSZwXVPxFjFufrJD3IRAOXNFrITBvlX+1wvLIA0dNm5az6w+IAolRHrMkIs3Bvanuw+xWuVRWwV89M00lw3qjxYRQmRV5VP8CYqHdExeQydUPxmllWQxZ0Ewk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736511402; c=relaxed/simple;
	bh=GGOk9D+nunM4T0ya75OKBiLrbBFOemHDDh2uU6HnyHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QiB/zTI6hUpfkMzR58FhFXhXJJ7Pf5C+1fbTaRYeILdK8gn5YogXRMK8B8/GvalTo3qKD133oA3cO3sGtRML41pkMqIPBcwua6ryc42WIL1XbnsoDc/EybSRsZR1DcmXvSgdyG9OL2WIXwSf6uxAkVx+LGzEh74S0yp8mcgeO0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gqstwN2g; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gqstwN2g"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3022c6155edso15625491fa.2
        for <workflows@vger.kernel.org>; Fri, 10 Jan 2025 04:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736511398; x=1737116198; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dx6LfbWoOZVo4WZlNr29Yr02kRZ3p+X0xl0ciBlTxio=;
        b=gqstwN2goIWjnQl6JTQ2rLF9l/WYOfYotrlBr+fQe+kOKP0NCkZi7107acw2ij06u0
         cUKWMMhBIzxcugohZArlf8Gg329Qumspc0FQtlp5P14T67Gm29r00F9VoR/HG/ixHRLo
         ePYsGEHnIVS+b6Efe+o4LMOzz3j2TdDrF6fdjuJg5B3nnZEzgS/NOvRaVp8y2VUeVcyj
         QM42Ys0OE882T6rIWfrGffNHuHluCk8uA1+ikMRF4M8hsjrWP7rwetO/njVa+szf1eGR
         jOC3ztv69yEG9sD9iXq2uW/OXDYJZ0EUKMXDRRWzg2A7MHQAdmOzMi2GFvQVy3wql1hV
         EaCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736511398; x=1737116198;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dx6LfbWoOZVo4WZlNr29Yr02kRZ3p+X0xl0ciBlTxio=;
        b=PiVhfQLP2GDJ7vVqw1adIWwOs31/7lc4lCSukbyR2C4uqYqmrKeg4D5rj+ow0Sdyqe
         hi2/ZTeWf488ohzeZWJ02BGt2rxB/oAb8s9Zr5swdskDAN1eCQ7wSOJTfO/VUMzN/HHH
         KUJrVJfgTDk3Kk5SOI+vZ9CWPhjenV5l18auk4jO3MN9dSHbHe/ipQDgquMYfXcb6H8X
         wNIUwMt5xkoQr5dA/N04FtHrsMuBhk+l+kSFtJIiHwvchLjtsmuzo6VDG+dWASEclsqW
         zAMWgu1k2PruUBfB/ji8IR0UjZPT3U14G88i6ZcYTF52Tbeo6I3Q7KV6iJWoGQ0kn8a5
         DfuQ==
X-Forwarded-Encrypted: i=1; AJvYcCU07kRKQYY7OWZUeSOMwgOse4iJlD83HnLPZ6H15nCCk1kFhhiUH4UDFfnU3+0QnUaNlMl5uE8g+eA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIkTSf8ug54DBziL+0rXJtkAR1ll7NrnrLmI+BCTx/gk6dEUvF
	xZ3MW1jl0ptLq+sNrW7KzBVTaaUX2zoFoakhC8rDvFRwHUyID9Z/G1nH71l5NHE5W4YQNEHzzVf
	cN6Ki9zXrhy7B9qZGaHcF66ZEpy6R4+MZdcL3
X-Gm-Gg: ASbGnctwhAyGtBCmr5NAPD0J3FnORPe9u0HbvChlA1O4Wv2GB/P5NBXQfQLpqfrepNW
	CBpAHWlXtOGLUriifJ2AksRxPTc9JmihoRSCV7F+InpxcuurilCKRwf5e9OFfB9IT7fBH3/4=
X-Google-Smtp-Source: AGHT+IGVz7X+fbBVIzBdInnx2bkV3sGGjpZi0hhX8DWvZ9b1BNEo4hsq0wEuqhU72LBjprO2Rqcz30cGAQVOyHHn4rc=
X-Received: by 2002:a05:651c:19a6:b0:300:2464:c0c2 with SMTP id
 38308e7fff4ca-305f453158amr29422851fa.8.1736511398361; Fri, 10 Jan 2025
 04:16:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250110073056.2594638-1-quic_jiangenj@quicinc.com> <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
In-Reply-To: <CANpmjNOg9=WbFpJQFQBOo1z_KuV7DKQTZB7=GfiYyvoam5Dm=w@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 10 Jan 2025 13:16:27 +0100
X-Gm-Features: AbW1kvYg6Yj75R_YQTMDFKYPIK4IFfqRlUkZXLVrw7rnxTU_BdbrBR450FQtMuY
Message-ID: <CACT4Y+Zm5Vz1LL7m_BubwV=bMPgVjOVNpp12nDZRi5oesH47WA@mail.gmail.com>
Subject: Re: [PATCH] kcov: add unique cover, edge, and cmp modes
To: Marco Elver <elver@google.com>
Cc: Joey Jiao <quic_jiangenj@quicinc.com>, andreyknvl@gmail.com, corbet@lwn.net, 
	akpm@linux-foundation.org, gregkh@linuxfoundation.org, nogikh@google.com, 
	pierre.gondois@arm.com, cmllamas@google.com, quic_zijuhu@quicinc.com, 
	richard.weiyang@gmail.com, tglx@linutronix.de, arnd@arndb.de, 
	catalin.marinas@arm.com, will@kernel.org, dennis@kernel.org, tj@kernel.org, 
	cl@linux.com, ruanjinjie@huawei.com, colyli@suse.de, 
	andriy.shevchenko@linux.intel.com, kernel@quicinc.com, 
	quic_likaid@quicinc.com, kasan-dev@googlegroups.com, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 10 Jan 2025 at 10:23, Marco Elver <elver@google.com> wrote:
> > From: "Jiao, Joey" <quic_jiangenj@quicinc.com>
> >
> > The current design of KCOV risks frequent buffer overflows. To mitigate
> > this, new modes are introduced: KCOV_TRACE_UNIQ_PC, KCOV_TRACE_UNIQ_EDGE,
> > and KCOV_TRACE_UNIQ_CMP. These modes allow for the recording of unique
> > PCs, edges, and comparison operands (CMP).
>
> There ought to be a cover letter explaining the motivation for this,
> and explaining why the new modes would help. Ultimately, what are you
> using KCOV for where you encountered this problem?
>
> > Key changes include:
> > - KCOV_TRACE_UNIQ_[PC|EDGE] can be used together to replace KCOV_TRACE_PC.
> > - KCOV_TRACE_UNIQ_CMP can be used to replace KCOV_TRACE_CMP mode.
> > - Introduction of hashmaps to store unique coverage data.
> > - Pre-allocated entries in kcov_map_init during KCOV_INIT_TRACE to avoid
> >   performance issues with kmalloc.
> > - New structs and functions for managing memory and unique coverage data.
> > - Example program demonstrating the usage of the new modes.
>
> This should be a patch series, carefully splitting each change into a
> separate patch.
> https://docs.kernel.org/process/submitting-patches.html#split-changes
>
> > With the new hashmap and pre-alloced memory pool added, cover size can't
> > be set to higher value like 1MB in KCOV_TRACE_PC or KCOV_TRACE_CMP modes
> > in 2GB device with 8 procs, otherwise it causes frequent oom.
> >
> > For KCOV_TRACE_UNIQ_[PC|EDGE|CMP] modes, smaller cover size like 8KB can
> > be used.
> >
> > Signed-off-by: Jiao, Joey <quic_jiangenj@quicinc.com>
>
> As-is it's hard to review, and the motivation is unclear. A lot of
> code was moved and changed, and reviewers need to understand why that
> was done besides your brief explanation above.
>
> Generally, KCOV has very tricky constraints, due to being callable
> from any context, including NMI. This means adding new dependencies
> need to be carefully reviewed. For one, we can see this in genalloc's
> header:
>
> > * The lockless operation only works if there is enough memory
> > * available.  If new memory is added to the pool a lock has to be
> > * still taken.  So any user relying on locklessness has to ensure
> > * that sufficient memory is preallocated.
> > *
> > * The basic atomic operation of this allocator is cmpxchg on long.
> > * On architectures that don't have NMI-safe cmpxchg implementation,
> > * the allocator can NOT be used in NMI handler.  So code uses the
> > * allocator in NMI handler should depend on
> > * CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG.
>
> And you are calling gen_pool_alloc() from __sanitizer_cov_trace_pc.
> Which means this implementation is likely broken on
> !CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG architectures (do we have
> architectures like that, that support KCOV?).
>
> There are probably other sharp corners due to the contexts KCOV can
> run in, but would simply ask you to carefully reason about why each
> new dependency is safe.

I am also concerned about the performance effect. Does it add a stack
frame to __sanitizer_cov_trace_pc()? Please show disassm of the
function before/after.

Also, I have concerns about interrupts and reentrancy. We are still
getting some reentrant calls from interrupts (not all of them are
filtered by in_task() check). I am afraid these complex hashmaps will
corrupt.
