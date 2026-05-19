Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8B03ACEE2
	for <workflows@vger.kernel.org>; Tue, 19 May 2026 09:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184234; cv=none; b=o/ZRESq2v/EJIgcoiX/7Z3QS4BPEVAJCtOB9fmmfw1slJsapRRKctWIjF8jv8fWc0fGGo/5kjijG9D2VW6H9lIJw6ISBTFXnnIccXehKzGCLU/GauYml9cNK+va4gbsvs9HRFWTm0/r3DTw4U7ISEZ+sU5epCxogiUYkctK6jC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184234; c=relaxed/simple;
	bh=VV0WQeCgbPqBTi7yab+uEYQeq6u9LFtTUX4clbsM2Vw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rOyQpCd+U+Cv5/0z/V8zrwe5Q8CSMIvD6j41O8cdQrWn/d/HT7RxzRMu+seSY8RP5cK4Mzw+UskSmFgk+zom08spmN3KUlXsaJIxu6D49ajSW1Fx5Y3APY52BCkC5v1CBQePpqtmeMITC6YHK8s584/qH/5q8spTep32KQcmzSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbcb467f2bso3314857a34.3
        for <workflows@vger.kernel.org>; Tue, 19 May 2026 02:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779184231; x=1779789031;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+2SZGl9spcuw3ZVraVsNeWL62/l5e6HnqNdDh6fCso=;
        b=K9idcRcc++qDXrwBKxOcIFsTe0wIDcXwynaYieGaoAb1e5ubcXmwxvfeug2xzzrqiz
         zn7y3UolYNWgRKkIvnR5zfuoPVtd47NHPY9K6gzvQtu5H3VlFJLEjbXaU9S3eRNBQj3i
         lZFY8nr3cgjAD2aJVZds1ek521vVFRZ4l+ok0J4oEVU+LXEEY2u21t89SFoeXzzSbouG
         3PZ4SuQac750rus8GmxSy45tMJzI/xDYrrxxBnyt4T+EZJCAQj8w6/KhAh2PJtbn0HQk
         PV8EaZB0+GUpylNtPns9AktoeGk3AXgHUcUJFnwKjGnH0PFlwhZzGiTIupDKbJ9nx3W2
         MnWw==
X-Forwarded-Encrypted: i=1; AFNElJ/O3wfz6BQpcUImgGgdHzfa61DWuNLvNonHT16SJeZuHt+W802X615vccaB0MpNya38hgfRjOPCjRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfEgbq7H3ICceXrXFanaD57xsff4I8z1HcRbB9kMHCwNsvVpOx
	UsYeaOh10EvitS8mLHThX/hJ6AgqE8m6dPybETq9BpVuSj7N2lyIK6CJSLBSgUxZ
X-Gm-Gg: Acq92OFbpS4WoyPku1e7BWdSQkZV4EvaKmcPZHM35N1afoBii/IPHm/ontymPYdefMp
	wIccCNMy47Z1fbgSAdBLNYSVbVP0TNoQj2WmTcvCbBww/S2mGKO+4aNGbDsrDXYukhOVJ4m1Unh
	qXubBpe/CVxzYo6azKwwL/xabaGEKja7/wT8GTK1WfmlG+Ven299HC2VaLZU384JdqHW6xNunGa
	duDrqQ+WDpVLh7HGJMTr3FtYr/uTlZF/n5OqKlAWj0DEQQyxzDo3i0bQKO3hejPUydcJ+KWCIRU
	lzqEyOp2VvC1t37XlijVvS53zQ4klZjqPa/vnxU2GYT3cRr8vR3SGI199yrL1p54iL7/Vl4Yi0d
	mtdhYSVUuALrk6pKsRc6EU7jLGQDQv1WVuWTTROkcj5B6oAwrLECr5Vwa1X8bYbfpnkEeTtyLME
	rxodb9jlOxYNnqEXIEhjnTqHbhEXqzt0avZJIV9HotQ1CfdSQIa9PS/wwMeHrV
X-Received: by 2002:a05:6830:6f8b:b0:7de:4f6b:9e10 with SMTP id 46e09a7af769-7e4de65bc6dmr12882417a34.0.1779184231674;
        Tue, 19 May 2026 02:50:31 -0700 (PDT)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com. [209.85.210.48])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e55b95b82fsm10841059a34.12.2026.05.19.02.50.30
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 02:50:31 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7de4a9cb8eeso3365277a34.0
        for <workflows@vger.kernel.org>; Tue, 19 May 2026 02:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8uFzH8uNOT0RHFLjXeT+mNNKTc9SNCYQVPbgI8ANUobu6HxQMmpaPMMkRTG2VUDhqJvHvCK8g3EcM=@vger.kernel.org
X-Received: by 2002:a05:6102:511f:b0:634:d42d:15e2 with SMTP id
 ada2fe7eead31-63a403ac9a2mr7077474137.26.1779183821499; Tue, 19 May 2026
 02:43:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260518042833.272221-1-enelsonmoore@gmail.com> <20260519094820.1f05ab8e@pumpkin>
In-Reply-To: <20260519094820.1f05ab8e@pumpkin>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 May 2026 11:43:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
X-Gm-Features: AVHnY4Lfn8Mcrjf-CZtgFTL8ilhwbGlXFwz-O3Z8xcIZpla9SRL4d3C994HiNs4
Message-ID: <CAMuHMdVw349EBZUuYZAns3FnTndx0A=PHbznxarYuAQr8nbqDQ@mail.gmail.com>
Subject: Re: [PATCH] nios2: remove the architecture
To: David Laight <david.laight.linux@gmail.com>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-doc@vger.kernel.org, 
	devicetree@vger.kernel.org, workflows@vger.kernel.org, 
	linux-arch@vger.kernel.org, dmaengine@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-csky@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Dinh Nguyen <dinguyen@kernel.org>, 
	Kees Cook <kees@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nick Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, Dave Penkler <dpenkler@gmail.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi David,

On Tue, 19 May 2026 at 10:55, David Laight <david.laight.linux@gmail.com> wrote:
> The company I used to work for used 4 NIOS II inside an fpga.
> The instruction timing for one is pretty critical, it has some code that
> has to complete in 122 clocks (worst case).
> Our solution was to spend a few man-weeks writing a compatible cpu!
> I think it came out with fewer pipeline stalls (in particular it 'lost'
> the one for a (predicted) taken branch).
> The maximum clock frequency might be lower; but it is ok at 62.5MHz and the
> higher 125MHz in just impossible for all sorts of reasons.
>
> OTOH I really wouldn't run Linux on it!

Sounds similar to what CoreSemi is doing with J2 (nommu, also for
predictable latency), but their products do run Linux.
See the video from the LPC session at
https://lpc.events/event/19/contributions/2097/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
