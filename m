Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com [209.85.217.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FA928CF49
	for <workflows@vger.kernel.org>; Tue, 13 Jan 2026 18:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768330520; cv=none; b=pI9hfvhzyvNuBt4EbxV9Brd8pxAw0HigHDqJK/mQxO6Mr2prWdDipBhR1SFRiwSjRVVLxGzhdxFon10tBHDOH7/h1B7XlKZlnExxEiC+PoacKW2GNUY3mjbNexgmQYo0mOkqSF7uQXVHkfP7JQSF2bpjVCJW2G2c6EvzkTUPoGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768330520; c=relaxed/simple;
	bh=8q51W8p4lFL62dwhn7ILuet12kILdNK8mg5KalyWgM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qRn8n1xHya4hSRKDdlldlQ+AoKozHydE701pq2kNTnHz96dfH3PTFX6dktXarwl5Tn6kl9isTf92lOYHiZ63mjK91TSviqqpsH9nUVjRzcxV/8HLVHl0vRwWDQPPWC2ITNoBjiwWuz6ljleqy8JLe35N0Xfrua3gs22P4FpjCpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f66.google.com with SMTP id ada2fe7eead31-5ecddf73062so84573137.1
        for <workflows@vger.kernel.org>; Tue, 13 Jan 2026 10:55:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768330517; x=1768935317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NjWKof4076b+nCQR/PRIrOGanRyaKJuuJZgutI/yHYg=;
        b=ogiEIOAUTttu05vk+90kOCCBSVOFBTxuKyUH8qbm1vkbcObDu16VkyKyFjRD3d7rYV
         G/+meVqJzngRc9acOAd3EOQyDofqzlVRtg8uAzpII1BuwsXGbDDc+FtqwM6Wzo7TYfD+
         hEN/6iI8YKCycaTC7prQLDQxoLOul8mQgH31Pbs+uJxkC2ODoic4sJUCeMR8CdLHURZW
         KcukJn10w9UnT28tmWK4sE+f0FrXkL/R22bWhY52FukbraNgb6+Z/Ze2432aQTA0UE/d
         91ss8T6A76o5fFHHK3b1x39CwEezlf3A1L9ahDmFQtV7bvMortYl+9x78Jpf3bN6bKhA
         0Ivw==
X-Forwarded-Encrypted: i=1; AJvYcCXjXzlx4TrLA09MXQYpZmB8Sy+37+3RC3Ak3/HZD3FE0UYIfyJigCYtu1GeaP/MUXoeA3+3Dj52VOY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb/HHjVzh7NwVMjWehbaSGRVAX+XTvlx7LGQfNZhU+7MllGlp1
	P35LRbI5QEDZQRzVoMZDDHFX0ss9Oohth4noDWogO+Eg0me5Ptbfa0F3C4+Lik9r7FU=
X-Gm-Gg: AY/fxX7qN5lWKzkx8DqWvED3iDnIHzugJ78FvSPUv698dtxFNxRWXE2rCSxcscr7asT
	zeJp/QLzlXfGwyz2YwNPfvfoy172vfR2SC8W7t/m16SWAus85YGivdwNtMgPb0tK4scARKmk2OJ
	R1sziYBRA0yWERwUdHtedeh2AgYIBYLp0TJgviqPrS4duN6vKZEBqQOOzUgDSVYhgapX2XGMikg
	84fIRY3GhLVz9vyfrp5f9PZqxIaqJc2FOoVQ0uahcwbzFZekhVTQiM0MHRQpr/8H94QMUf5ZV5f
	fr/Cz0iMJoFOEmHfkd2QcNZPyM4I9uzP8xeGp+P4gblAHMJCEkK0EYkum5BuvgFK/qZeowlMiwh
	qthdty63OeM+upITmZBZdbB8lcL8xWTJeZv06mOtTSgNYtNCyVadlt5J/qT+ZRZbZINFIRtwCXz
	x0FQJ0qdgbdFIkAXg7v8TsuLO6D5keiS55+2TxrAKN/Lvl/Eqw
X-Received: by 2002:a05:6102:f84:b0:5db:d36c:89d4 with SMTP id ada2fe7eead31-5f180144adcmr24623137.3.1768330516924;
        Tue, 13 Jan 2026 10:55:16 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5efb5bb6d11sm9884998137.4.2026.01.13.10.55.16
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 10:55:16 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso86264241.0
        for <workflows@vger.kernel.org>; Tue, 13 Jan 2026 10:55:16 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXtxpJ2UquC519FB2QsWlCaEtPnY5xFeA12ap+Q3AUaRvRO7QBeQ+UhYF05JW/BaE0KdYMnwKVGMsY=@vger.kernel.org
X-Received: by 2002:a05:6102:38d4:b0:5ef:233e:6b25 with SMTP id
 ada2fe7eead31-5f16cb3b278mr1757899137.13.1768330516560; Tue, 13 Jan 2026
 10:55:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113000612.1133427-1-dave.hansen@linux.intel.com>
 <20260113103609.GA1902656@google.com> <921e154d-7e54-40ff-ae85-97b6cee7f8b2@intel.com>
In-Reply-To: <921e154d-7e54-40ff-ae85-97b6cee7f8b2@intel.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Jan 2026 19:55:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUJX4DZzUuy9k8WBtRJm2QHdN=xQ9zfXudTPdHyLRvUrw@mail.gmail.com>
X-Gm-Features: AZwV_QhkcBOxhfA-T8w_e1l-LSq2Jx22XOANMJuW-iYC-FegHcdFGbGLo6DoatQ
Message-ID: <CAMuHMdUJX4DZzUuy9k8WBtRJm2QHdN=xQ9zfXudTPdHyLRvUrw@mail.gmail.com>
Subject: Re: [PATCH] [v5] Documentation: Provide guidelines for tool-generated content
To: Dave Hansen <dave.hansen@intel.com>
Cc: Lee Jones <lee@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	"Paul E . McKenney" <paulmck@kernel.org>, Simon Glass <simon.glass@canonical.com>, 
	NeilBrown <neilb@ownmail.net>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 13 Jan 2026 at 19:05, Dave Hansen <dave.hansen@intel.com> wrote:
>
> On 1/13/26 02:36, Lee Jones wrote:
> ...
> >> +Even if your tool use is out of scope, you should still always consid=
er
> >> +if it would help reviewing your contribution if the reviewer knows
> >> +about the tool that you used.
> >
> > Parsing ... okay, that took a few goes.  How about:
> >
> >   Even if disclosure of your tool isn't mandated, providing this contex=
t
> >   often helps reviewers evaluate your contribution more effectively.
> >   Clear documentation of your workflow ensures a faster review with les=
s
> >   contention.
> I agree that the sentence is hard to parse. But, I want to explicitly
> say "out of scope" to tie this in to the rest of the section. How about
> this?
>
>         Even if your tool use is out of scope, consider disclosing how
>         you used the tool. Clear documentation of your workflow often
>         helps reviewers do their jobs more efficiently.
>
> BTW, I do think we're well into diminishing returns territory. I'll roll
> this into a v6 if there's a v6. But, if it's pulled in as-is, I think
> the original can stay without causing too much harm.
>
> ...>> +Some examples:
> >> + - Any tool-suggested fix such as ``checkpatch.pl --fix``
> >> + - Coccinelle scripts
> >> + - A chatbot generated a new function in your patch to sort list entr=
ies.
> >> + - A .c file in the patch was originally generated by a coding
> >> +   assistant but cleaned up by hand.
> >> + - The changelog was generated by handing the patch to a generative A=
I
> >> +   tool and asking it to write the changelog.
> >> + - The changelog was translated from another language.
> >
> > Nit: Suggest removing the sporadic use of full-stops (periods) across a=
ll lists.
> >
> > Or add them everywhere - so long as it's consistent.
>
> The rule that I read is that when the bullets are full, complete
> sentences, you should use periods. When they are just nouns or shards of
> sentences, leave off the periods.

Or for the latter: use commas for all but the last one, and finish
with a period.

Just my 0.02=E2=82=AC, from an old LaTeX user...

P.S. Linus seems to disagree, as he consistently drops the carefully
     placed commas and periods when merging my pull requests...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
