Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03AA7149C42
	for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 15:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954256; cv=none; b=Dnz4Z6vmi2O2wldtLqD5gynJUvoVu5w4sGBI5HO8SJL69mo6REEwX++l2SNn5iTlFtcG2NZe+jeGQcHBc5xzVu+QYE9mxmh/VzK0dyYBVyTKC1CU/KnrkxR147VbmY3rIY9BFj/taYYnNOZQynm3dCwlPiErlP4tHiG0Zcjp8UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954256; c=relaxed/simple;
	bh=Bpf2qL5I6xkO36ZzCjZ/+a8A4G3Ah2Q1+WzD33Qs4qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksMKHlmvlDifUM+DpUajQb99XjCUdC6gGMgP1zr3CAW3+1ymMXqitC2rsrj8FGeznoKqXw/eb9GclHXPgtGTZ1g+KtyZST/UsmlibTbDPmNQwKK5oMMVkjWOuFDcsNcx9Nxxpa0q0mh70c3WeXclfQvrF43CqowLSlzsKMRritE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eeZTQM5e; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eeZTQM5e"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6dd5c544813so67909076d6.1
        for <workflows@vger.kernel.org>; Wed, 15 Jan 2025 07:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736954254; x=1737559054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7WzHPt/cWpfOHApvRgjD4QZNtPcP64L7GIPpO/klVU=;
        b=eeZTQM5eg/bgxEOuhtAY4PY887dWCgHOxhGRbiqT+WtaVEMD9Av/bI9tYYJ/IkSGVP
         i6/vc+6kDLAS055PEiDMf+y+1npSO5Xc4v4naNlBxh6AgOYPm0kNgYQ1rAsD28LDU3KD
         YEMm5WUL83TF7iytp7ED6njRrcbbFMLWpf9PC94h+X3weA96k8gUnvN7ZqEh14oFrDiA
         qIDbwyfv66W6Luzqf40vuaWR6ZJdu/Yxuwmbkvv5IxEsexXuKmiu9Kny4/nnOsT8vJUY
         hGSUwY9cGH0Wzyjmz+nqGe3zHc1dQsb1gWzqeBuq4TElN7xZkA3nV2u0tkFa/msYU4W9
         Bb1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736954254; x=1737559054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7WzHPt/cWpfOHApvRgjD4QZNtPcP64L7GIPpO/klVU=;
        b=g3rwjKu5KXrjYdy3hi3C9jGjVhQg8RYFe3O3Uo1op8dnvBcZ824oZ2Zx6DznQg24P/
         JbTAUMXWhQPkbELADjapZvS4CNDuRSZ6YB5EER1nZBmHT+rZc5FwWr+0D2uaJ4sAD1jM
         fy9S3pIl3NnXfnmO03A0bC2K46rzHqa1MtOlykUnR8XpxbAaUFQ/Lw6jk9UDp7LrgwN3
         cRCwXoT4BqoxHYfIkDFR39OsV5bsjHkjru8jOwy5b1GyMhqOIOYNykXYg+1LrQdbv1Uy
         p61E3mDj/wyKYaaKXZVUJs1B7KupXOg90L5kpAGJVd8hcR3azS01yGRYzjxbFR7bheVM
         a6WA==
X-Forwarded-Encrypted: i=1; AJvYcCX7A7oQBvweGkWTKg6fOnwGcaYDF1c3IGaw24PBLMyfsuVVd1y0nTUWJyaVygGUgCcpJNGTi6dHD+U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzauFaUBjOzebiccF0YZbTHeNUGjOaDh4yZWo9v3o5/KMFA5ML5
	m7oBOm3wi6bZAIelO/zjXtBf3tbBSEg8ZBAK0WtQqGfb/ONByDgUhR0DyqdD10E8/5zfTMxhJnj
	t8MC/oxVpHdSs6xsmaegiUVsmIz+vf0bn5kEj
X-Gm-Gg: ASbGnctJhB8cXPBhqu8AXMLPBKrBo+XgD08o7EY5Xk2Gosl5RYkEvoeAqLz3ZGyXeck
	dqT0rlp8Nbew3Yaa4gGhML4+u3zvULw8GpW7QNhujOlWGisGqIVFMaHAe/Ulr8A1Qwy7Q
X-Google-Smtp-Source: AGHT+IExamaQV69QfDT6mt7pi4rOTIShHeVotAi3fypa8T+VZtB/JGqy31OBdOOudK5fsyrNV0iaD1BO6s7Tv7OYVl4=
X-Received: by 2002:a05:6214:2f8e:b0:6df:ba24:2af2 with SMTP id
 6a1803df08f44-6dfba242b5bmr334969386d6.25.1736954253788; Wed, 15 Jan 2025
 07:17:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250114-kcov-v1-0-004294b931a2@quicinc.com> <CANpmjNPUFnxvY-dnEAv09-qB5d0LY_vmyxhb3ZPJV-T9V9Q6fg@mail.gmail.com>
 <Z4ZfzoqhrJA0jeQI@hu-jiangenj-sha.qualcomm.com>
In-Reply-To: <Z4ZfzoqhrJA0jeQI@hu-jiangenj-sha.qualcomm.com>
From: Alexander Potapenko <glider@google.com>
Date: Wed, 15 Jan 2025 16:16:57 +0100
X-Gm-Features: AbW1kvYef5mtP3iXS_rQEHTfWGlWNRIExvdT9bNMIFnqNFmmY6UipxblFzMqMNY
Message-ID: <CAG_fn=XFkNVkT3EmB99SdEBAwkGq3EUdM9xR4rzH_HatrJw8rQ@mail.gmail.com>
Subject: Re: [PATCH 0/7] kcov: Introduce New Unique PC|EDGE|CMP Modes
To: Joey Jiao <quic_jiangenj@quicinc.com>
Cc: Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, kernel@quicinc.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 14, 2025 at 2:00=E2=80=AFPM Joey Jiao <quic_jiangenj@quicinc.co=
m> wrote:
>
> On Tue, Jan 14, 2025 at 11:43:08AM +0100, Marco Elver wrote:
> > On Tue, 14 Jan 2025 at 06:35, Jiao, Joey <quic_jiangenj@quicinc.com> wr=
ote:
> > >
> > > Hi,
> > >
> > > This patch series introduces new kcov unique modes:
> > > `KCOV_TRACE_UNIQ_[PC|EDGE|CMP]`, which are used to collect unique PC,=
 EDGE,
> > > CMP information.
> > >
> > > Background
> > > ----------
> > >
> > > In the current kcov implementation, when `__sanitizer_cov_trace_pc` i=
s hit,
> > > the instruction pointer (IP) is stored sequentially in an area. Users=
pace
> > > programs then read this area to record covered PCs and calculate cove=
red
> > > edges.  However, recent syzkaller runs show that many syscalls likely=
 have
> > > `pos > t->kcov_size`, leading to kcov overflow. To address this issue=
, we
> > > introduce new kcov unique modes.

Hi Joey,

Sorry for not responding earlier, I thought I'd come with a working
proposal, but it is taking a while.
You are right that kcov is prone to overflows, and we might be missing
interesting coverage because of that.

Recently we've been discussing the applicability of
-fsanitize-coverage=3Dtrace-pc-guard to this problem, and it is almost
working already.
The idea is as follows:
- -fsanitize-coverage=3Dtrace-pc-guard instruments basic blocks with
calls to `__sanitizer_cov_trace_pc_guard(u32 *guard)`, each taking a
unique 32-bit global in the __sancov_guards section;
- these globals are zero-initialized, but upon the first call to
__sanitizer_cov_trace_pc_guard() from each callsite, the corresponding
global will receive a unique consequent number;
- now we have a mapping of PCs into indices, which can we use to
deduplicate the coverage:
-- storing PCs by their index taken from *guard directly in the
user-supplied buffer (which size will not exceed several megabytes in
practice);
-- using a per-task bitmap (at most hundreds of kilobytes) to mark
visited basic blocks, and appending newly encountered PCs to the
user-supplied buffer like it's done now.

I think this approach is more promising than using hashmaps in kcov:
- direct mapping should be way faster than a hashmap (and the overhead
of index allocation is amortized, because they are persistent between
program runs);
- there cannot be collisions;
- no additional complexity from pool allocations, RCU synchronization.

The above approach will naturally break edge coverage, as there will
be no notion of a program trace anymore.
But it is still a question whether edges are helping the fuzzer, and
correctly deduplicating them may not be worth the effort.

If you don't object, I would like to finish prototyping coverage
guards for kcov before proceeding with this review.

Alex

> > > 2. [P 2-3] Introduce `KCOV_TRACE_UNIQ_EDGE` Mode:
> > >    - Save `prev_pc` to calculate edges with the current IP.
> > >    - Add unique edges to the hashmap.
> > >    - Use a lower 12-bit mask to make hash independent of module offse=
ts.

Note that on ARM64 this will be effectively using bits 11:2, so if I
am understanding correctly more than a million coverage callbacks will
be mapped into one of 1024 buckets.
