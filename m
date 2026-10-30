Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357911;
	b=nw4tFmIMJVJSIjQFMQzxzWo8AJ0KEGwqEN9uujP4l/c3Pm1Izn2JaUwO3BVNCbL5ISjM
	 ePyuHG9BDzAmPTJHzKSK/A8pTWvr6TsQ7xlvt7P+ByKTbk4gt6Ru0lqUudALYPP9r+G/k
	 QZsS6KUq2AMHABl+Z1+h9tbR5rkg7vM9QWjQAHC7vxINbuBagWujCOOJNzayIbyI60MXk
	 XE8UD/q86GjMFtC9zbSWkocgnoLLImJAvE4fwtByZ7rPTZrqttTFYzblV/BbczOsHti2p
	 12mQ0WfppzfdxNXb9B9UMr3K2zx+RDlZlGtQZp+EAsU1vi9OsOP8aXpbLk65D9HGi9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357911;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=qANwLEKHR+Q8Yt9LD0kW884nruLVZmuaF5lEr9bqDbs=;
	b=x10kBGhbAOtoSSV70saK8VqQAvmXAdbDAhbp2XMCVkXSrhEGvXpeGf1pEGI5kfo+YTBs
	 k3zkVC6z1/Iul+pyRmCeZ12atJcbG17M5cdPCV+psKZGFNMtrrtWP9Q3/m6/N0GXvbc/Y
	 79FMxT6NB0q7u9ad58DzaaDN+iB6FzGfTrZsJYAyvi8JgeL6hHf2qjfLDWFMg5K3ZDRtB
	 v7+Fhe1ri2KNpAyU/i2omQqa9fz2h6i/iVXe27Q4nTXhgWP9jrS6qET+RNhmt9vVQKu6Q
	 ykcPUeoxHZF4/Km8l08YgIkSTXU/6SbywONMFhZSBA4o0o2jUVdkJWE9C+qGwAcbbNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87FDB606A31C
	for <workflows@vger.kernel.org>; Fri, 30 Oct 2026 10:58:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87FDB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-7a6e560f580so343904137.1
        for <workflows@vger.kernel.org>; Fri, 30 Oct 2026 03:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357910; x=1793962710;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qANwLEKHR+Q8Yt9LD0kW884nruLVZmuaF5lEr9bqDbs=;
        b=MTMd/tQeUcrKMb7WEDzVcq8Wyj/m3Nji5ujGKXx0JE35Q/3PsSJ/itozUnA+wJftku
         wQck1YGBITQnrsXRoet/E73Vb3DreqptAmk3RzMJUFK9VXb6IfZqltQH1BqKdvjJyolY
         JQ4VPlbptCasp2TtPFNNv7IXXonuVqqXRdBNmFhwEmsN/TAOlJqk5fLmXtzlzVIXC3WT
         17VGRGOxnFfdIkETSrcf/0pFT9WXp1RO2lzPmDCsbxsNL3i38ELmcbmsy/5EMQ4+zwYb
         afhKFBQPtbts+i6/f3T5KU/cc79UZhxpWCtWchOuROFGP1ktZzY8PBzCaKvwWhMnnpGU
         HoVg==
X-Forwarded-Encrypted: i=1; AKwUvByThpYQB8WNDwnu5KL4wBWmJyXtH724RPY8BCqisarjIqf4zfTrlI9F/R75R5h/j1V5HoXTatlPsTg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlYAvpX5Dd+Ihzld/qgVBJBw6S6lFSmNpU3wT5QdqaOS40uVtL
	YFw/Bxjtc8D0X4KS90JqBozAlB+OPEg2RYvsXKg+/ocjIE5uo/yjdJdvPWxEfH2Z
X-Gm-Gg: AYBFou0ylOrzCQ8LEuNr8b1MmsXOzmOK7Is7a6444CgWac5KNnn9rgdzD7722aS34WV
	nk7NgGdwTMM8jXz8cHpk3zWNpA0qRCzVn8cKZQGRwoz40C0Q9koTCtCwinX7x1HaDqf65P+jrYw
	Ot/EtCr5L4WJMw+1YQ1gKRUwGffiqHfDnCVrxBzU4iA2SiTn01EMlwEIAh1s1Rtjg+kzk0duijc
	lT0KXx7ccBG0hn5orLuecxYKvw2Pbx9ybBmT/oNOAJ9wrwXXBspwN1bm0KTYwteWVwDOcFPEIoY
	h3X4r0J10peKghlZuBmS3IRIN/desmZQ1Yl1N042ketwHZWjQj/3L0hoORo8Vtkg/FMV1/72mVe
	LkPIYifRMUua5e5E/2bT/KtDWo6uE/xYtxEyHckPB7x+PH6tT6aqf51WauDoiFuABzLh1CCn7cd
	S9cQEn2BEy4BucjHRoTmIP3vR3bFBghYmGMWPAw5YwWZD5EyOk/eiJL1e0bZQ2MhhxfI0WR43Ei
	p36EyaUbiI4N/3IHtm0XXYKv++0dauzLDAIyvi0AJOdOHcQyrI812BmAqohtjHgSyvw1Rrgreom
	BCsSRPMsWhfnUbkYo2XhFFmaBfK+sdEByV3oqxzhYV1H5pD8ct6YM3R234ldMb3hUFM=
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr980896137.35.1793357910510;
        Fri, 30 Oct 2026 03:58:30 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d07754c1b4sm1808057137.4.2026.10.30.03.58.29
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:58:29 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7c3b6e8225dso381280137.2
        for <workflows@vger.kernel.org>; Fri, 30 Oct 2026 03:58:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDo9dw8j+jajrNND04bR5o2T/cMVmwbW2S54VAKAj2DJ7JAZLGGSg9KkI3Mh3Ux1M3ackXvZbJgfs=@vger.kernel.org
X-Received: by 2002:a05:6102:3f44:b0:7cc:24e1:77b with SMTP id
 ada2fe7eead31-7d072270da8mr920373137.4.1793357909406; Fri, 30 Oct 2026
 03:58:29 -0700 (PDT)
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029153459.2257998-1-kuba@kernel.org> <9A74CA14-D4C0-4252-A3E7-256F9626B513@tipi-net.de>
In-Reply-To: <9A74CA14-D4C0-4252-A3E7-256F9626B513@tipi-net.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Oct 2026 11:58:17 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVJVxpX6OLVpE9K9CDY5q61A2rFGf7FpUjs7xpFwReEzA@mail.gmail.com>
X-Gm-Features: AclHuK9le6YNpAmBa-b_MrMdfR--FywlxS_qw1QqJzPLGdBMqrmLc_GWMKZnVUw
Message-ID: <CAMuHMdVJVxpX6OLVpE9K9CDY5q61A2rFGf7FpUjs7xpFwReEzA@mail.gmail.com>
Subject: Re: [PATCH net] docs: netdev: try to force agents to disclose info
 for fixes
To: Nicolai Buchwitz <nb@tipi-net.de>
Cc: netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 19:51, Nicolai Buchwitz <nb@tipi-net.de> wrote:
> On October 29, 2026 4:34:58 PM GMT+01:00, Jakub Kicinski <kuba@kernel.org> wrote:
> >"LLM-driven-developers" are not including the info about discovery
> >method we want to see in commit messages. Try to add more forceful
> >language to make agents ask for it. claude and codex seem to load
> >maintainer-netdev.rst already.
> >
> >Signed-off-by: Jakub Kicinski <kuba@kernel.org>

> >--- a/Documentation/process/maintainer-netdev.rst
> >+++ b/Documentation/process/maintainer-netdev.rst
> >@@ -315,6 +315,10 @@ reproducer and against kernel selftests. If the bug is in a hardware driver,
> > the testing statement must include information about the HW on which the
> > fix was tested.
> >
> >+Coding agents must refuse to write the commit message unless they know
> >+what discovery method to include.
>
> Maybe make it more explicit, as the sinfo bot will ask it anyway:
>
> ... and whether it was reproduced or tested?

Which is true for anyone, not limited to bots...

Do we really need "different" guidelines for humans and bots?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
