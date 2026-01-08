Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com [209.85.218.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFC46B5
	for <workflows@vger.kernel.org>; Thu,  8 Jan 2026 00:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767830815; cv=none; b=eKb5cFhWTDMIP62at0NSQah0VsnnGm3tjfLLIzmggxGWmdACOxIenUK7jsqKEiSWsFv3VudlOJE11HIeqH7EmTOmlPiOJiqjfLeVGo/YsqD7ok2sXeOkTpV+igqttY1TsosUy1ZdfSUXX8atJqzAISnUGETlBp2iqUd9EnKm1YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767830815; c=relaxed/simple;
	bh=QtEAbfVtiKn5cj5XRGpsGTJDUKFjZEuBHGDKzvXXDjI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hyBZSqv+M8kEcN+HDAomoaNXbKrm9AvpPETaCof+Y/lnSIsB7yfe/YDYIljHyoq4B7wJm1PfQlIxckCNQs5skkZqU67yHxiFllyqkgniheWt7aDQTXd7TX20DMQxz7W5XGQrxizvdK1HM+tkGloKilYG6ASLX52P/0mCwSL+76A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=HOiBgijc; arc=none smtp.client-ip=209.85.218.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="HOiBgijc"
Received: by mail-ej1-f66.google.com with SMTP id a640c23a62f3a-b83b72508f3so431022666b.2
        for <workflows@vger.kernel.org>; Wed, 07 Jan 2026 16:06:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1767830812; x=1768435612; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=foSy0mHbq+bvIgetJxzEzdfsEyD2VC5LP6q78bup1rM=;
        b=HOiBgijcJzx5/oTEsv27pOk21Dz3YknaE9u1M4n8Vkw6peguJPk5zk/DmDO6LwHuMw
         yfnSh2+zdLh381BZc5j8fNBtRNoU+G8XgVXCT2E4bwO48leX4CY4XV51GFNqQtBYuxM/
         bfSUD6MFt8VwzVyyMq+gyV+fF1LkVUIKwZH7I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767830812; x=1768435612;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foSy0mHbq+bvIgetJxzEzdfsEyD2VC5LP6q78bup1rM=;
        b=aF16tfDglEbHMXXD3uZFfr/Xz5fVPRh4O9QNc7t+LWGN9pWbq5o3kQ4+48quGrDJZc
         13/qVpjO4XtJ2xWC2lncbNBRRqit2/j1/qqp930FAs+8dXvRh0kbIA2gSDNxfa5PuTpW
         JGlVDyvG9DAf9vcTfI4qlSA5WtT9drZtAWUeUmWXMGjlLUNGbRXXS+hdWBIPsfEZgot0
         eahIHv43RAug0nTaWAPBubLp1mDPDDzygxroSjcqqKryvrOA9WpySzZQePv/xqw6KZrt
         N+RqLYWwYNYVUzP/KzrOUjI/BmrSgwJbQl1Ufs987p7wewAc7h9GFQTHdU7AOFAV2K7o
         020g==
X-Forwarded-Encrypted: i=1; AJvYcCUeE1pBKdmWSU+Cl4ksoeF6OgwrXRGK86g9yDDfaohJJ70+YNB9o9ACseG6K9Q6XOcAetYw0Q07FAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3NDmdOL0pCDLqFwbK64Dz7qLrQ6+8VO8z/qze8b2nmopgpWk
	IlOVLeskf4yrH5XhcS3jOO7BS+dmgB0tfudk8Z5w4uoo91iPU6GUgOVG9fKRkFmPy1EJpUruEtV
	XvKdDtxsAKw==
X-Gm-Gg: AY/fxX4VBI2JhslUhlX4dy6gfEKlPtUlnzDbGRzJasruenHXExE0FM6cUv8bl+G/ron
	TPrZh3ju3IPlLrplLwtYQYl759BevzkfCCeWtmsuwO+c0PfXPDGVwhrfSbD1C9hG/l4kc+DENM0
	SES3z+/ZkEqqNKaddHN0JFWRUYr5XMvb88OmVQDeAPQLwXscDzM5nJGZDnyIbZfVfFDwlIRm+p7
	eKL0mUZ8i8CEpcckiTpDM1T2eAk8IrBpyX9NUtmMVq0+QsRTvBia3wfrv587Owvvd+huEtxbCye
	pp71/RWU8JVmFXQ2i3MSfiDTvPC3kcpYXMvE1hDM5Ck4MarE/zg9R1qTDy2U/dZMOMqA9kTzYSM
	suoT4Ar2wa1QcZRYREPpViDQ9ieLBu41LetEvjbptlojvMafkcpMyYyNAW4TP66aS44Uf9G5sXK
	7hZwNKRDsARHCb/stksWwgZAx3SZy8GLhnIfYcTvpjMJ7tUKWJzi/vBZWZGbX3
X-Google-Smtp-Source: AGHT+IEwH7bIS5G6R6/UivoZleruQMaEvYgDEveASTB0K7QikWP+7xwxh6cKF7JiohKkY1pqF56PyQ==
X-Received: by 2002:a17:907:868f:b0:b83:246c:c857 with SMTP id a640c23a62f3a-b84451dac03mr416419066b.17.1767830811880;
        Wed, 07 Jan 2026 16:06:51 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4d0290sm648277766b.32.2026.01.07.16.06.51
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 16:06:51 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b7355f6ef12so492667166b.3
        for <workflows@vger.kernel.org>; Wed, 07 Jan 2026 16:06:51 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVjuDefu0MhnkDApjy+Gx/NsZt+WOy8k/A1U1+ODNRhlufP2OTBD3D/Ti1ED+GSilGR5vU4y/X3BHk=@vger.kernel.org
X-Received: by 2002:a17:907:9716:b0:b80:411f:aa50 with SMTP id
 a640c23a62f3a-b844538b340mr480612266b.48.1767830811282; Wed, 07 Jan 2026
 16:06:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
 <1e982055-47c2-43d1-a919-93b3e59f2ed0@lucifer.local> <93aadf2b-0df4-49eb-91fd-b401b44ce3af@sr71.net>
 <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
In-Reply-To: <1c74353c-40de-4d0b-a517-92a94f8b4af8@lucifer.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 7 Jan 2026 16:06:35 -0800
X-Gmail-Original-Message-ID: <CAHk-=wg0sdh_OF8zgFD-f6o9yFRK=tDOXhB1JAxfs11W9bX--Q@mail.gmail.com>
X-Gm-Features: AQt7F2o7ADy4euEN0cDDHOeWG2qEVyCnup91Q83wkHbB-5SZ2fIILimORUfY0t0
Message-ID: <CAHk-=wg0sdh_OF8zgFD-f6o9yFRK=tDOXhB1JAxfs11W9bX--Q@mail.gmail.com>
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Dave Hansen <dave@sr71.net>, Dave Hansen <dave.hansen@linux.intel.com>, 
	linux-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, SeongJae Park <sj@kernel.org>, 
	Dan Williams <dan.j.williams@intel.com>, Steven Rostedt <rostedt@goodmis.org>, 
	NeilBrown <neilb@ownmail.net>, "Theodore Ts'o" <tytso@mit.edu>, Sasha Levin <sashal@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Vlastimil Babka <vbabka@suse.cz>, workflows@vger.kernel.org, 
	ksummit@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jan 2026 at 13:20, Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
>
> Thinking LLMs are 'just another tool' is to say effectively that the kernel
> is immune from this. Which seems to me a silly position.

No. Your position is the silly one.

There is *zero* point in talking about AI slop. That's just plain stupid.

Why? Because the AI slop people aren't going to document their patches
as such. That's such an obvious truism that I don't understand why
anybody even brings up AI slop.

So stop this idiocy.

The documentation is for good actors, and pretending anything else is
pointless posturing.

As I said in private elsewhere, I do *not* want any kernel development
documentation to be some AI statement. We have enough people on both
sides of the "sky is falling" and "it's going to revolutionize
software engineering", I don't want some kernel development docs to
take either stance.

It's why I strongly want this to be that "just a tool" statement.

And the AI slop issue is *NOT* going to be solved with documentation,
and anybody who thinks it is either just naive, or wants to "make a
statement".

Neither of which is a good reason for documentation.

             Linus
