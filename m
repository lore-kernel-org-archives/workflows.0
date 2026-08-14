Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0E335A925
	for <workflows@vger.kernel.org>; Fri, 14 Aug 2026 14:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786716024; cv=none; b=WksAhQqM2cSRYxZeMaMtYaGJLx8VUFokAdTNG3V31NSY2grHfEawmwj9cjGKdQ7O9q2x5ny1ZM18wSY2Ru2BDzQBgjiVL3tIv+7gEiamjqLd6f7wMnbh6d40z3MgEJzhta9mEk94Fx2VOR2BQQ10PI7CrYvgENJS908g8euqOEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786716024; c=relaxed/simple;
	bh=jnE+zrjdRPIAG/V+osLYILlYKK1uGEGBACBgUDiHPsk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NFK5eMMq2OvMZbLLPFrJXuj4T9RKO7jkf4VUft4CoOOWnL9cERRyBuAWVx/QcqGZBgVF5FOgXQnlUyvrpoF60Eb90j4ftxRwpN0osr5sIGQeyIG5qCUNEoDpgZ1GY8lFum9MGJQbvQjNavrGQAKtUCwVeWsvjmer0r0Dk/4j3kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso666225e0c.2
        for <workflows@vger.kernel.org>; Fri, 14 Aug 2026 07:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786716022; x=1787320822;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KBeE4Jbhv9pyM12HVw9v14dd7K0sZrphzuP4RnOH+Ow=;
        b=VRGAj/9dpJytjK82sXcN4Cb6h9Foj1RXVd0AR7gEW0NlbbOwsenI7juyLYvmKBu077
         BbbicYUJ5VyuqNz8ZDo/4+pV6hKaXElPwjS/qYUP7LGeU0xbVrR5nAPt71vqgbVEpQ9F
         wf8H/VJfhesTuaxjJ8X5c4OsekJxT86AWQ6K/IkgeYLhL+JohEK1OxuILLgc/V3KAzRP
         wRcBS3XlNX0RM0fys9+kDGtIrSx/ro5haTYD69EQ4pyRyz7q0uOQIRLVUFYlf0nPV3kB
         SgwR2E4+7Goqqd10ozeUmUVG+x8XP8v4UF1Xya8CINbLe9l4Drls03wVoKE7OtwrTtzd
         wB1A==
X-Forwarded-Encrypted: i=1; AHgh+Rp9Sdh8zfH5S44be/96vHs/Br6PnAo7I478uDi1+pnFulwLqi1AGXYGwxDCQtz+tK2DKHpvIgVvtuc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDmicfY+S33ZlSuLKDKMl4Y9hbp3QgMADAsijCf1WX3/ygKGje
	xYSd7/joue5ncJO2Hc+ogDE9fXLFPue7TOnRn3iphL6cXq8K9W7MeqQVU+1/9cmV71k=
X-Gm-Gg: AR+sD12NCsSqTwc068z1jawYNm1GaiHLZM9Lp2sVenaX8vWhKtd5DXhdzupH5k0yao/
	mRLraV38vAp82MVC2Q5YB1HLL3wo6dkeev4r3UL5OZMhrEVrYBPnIUm3BZkt85sLp5sPytu6Gh3
	+iPaaUshj7yUTBd0PoLOeSkmQLT3rRyO3DONZC37+pTlaXiEOEjOLdYTASVu/8bn/k4xeAlAJN3
	jQuKLlKjsulT9qSqBH5SdOK7FpPfQivo/gMi3MNFGBEtcPj+eJrUiN5iFZAmJ0a8uuRViJmw+/A
	tl3lb3k/ViD1GTnYA3hi8rExgUiOVMtt7pasgdWbyhx+Op7geq1cKOMr97ATiUep7SO2SyyT/Ot
	7o3yS+g9avLWtjAGo6jF8Bap6FyAy9oCEsWpJJxnGAXVvYJ7T9fAVOXg6tUjaFEzdhS7ZlhuOx8
	1euocvELJ1YdewsmP3vsl3SU+jxKBUFXRHRQqLqUKBDsHVDm4b6fyOTYQ03dZ/yJl2X9h277eln
	1R36RxM2wsp+70tIe7IorWRiQ==
X-Received: by 2002:a05:6122:3308:b0:55b:d85:5073 with SMTP id 71dfb90a1353d-5c591c9901amr1602931e0c.4.1786716022219;
        Fri, 14 Aug 2026 07:00:22 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97bfbdae5e9sm786057241.11.2026.08.14.07.00.19
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Aug 2026 07:00:20 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-966e7380109so600122241.3
        for <workflows@vger.kernel.org>; Fri, 14 Aug 2026 07:00:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpkaHNSYFMACPg7pyYaZEFfz4j3c4cueWpOxUNLOGzRFRSgwQXFQNHU+DVPtAanqkAsfvpUmRL/p40=@vger.kernel.org
X-Received: by 2002:a05:6122:488f:b0:5c4:1a0a:b52e with SMTP id
 71dfb90a1353d-5c591ec9771mr1475551e0c.9.1786716019318; Fri, 14 Aug 2026
 07:00:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260814134931.2281085-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260814134931.2281085-2-manuelebnerli@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 14 Aug 2026 16:00:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV461YV5jThYgoGAxnZhB3Vf5tAmcm-eML1o-jVRrerBA@mail.gmail.com>
X-Gm-Features: AcwNN1Xs2dRzpNCH6XKGLdEjSAU8N4IlXfCduMH-dczukYBUWMKvueNqo7GJal4
Message-ID: <CAMuHMdV461YV5jThYgoGAxnZhB3Vf5tAmcm-eML1o-jVRrerBA@mail.gmail.com>
Subject: Re: [PATCH] ver_linux: add comparison with required version and
 colour to output
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, workflows@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Manuel,

On Fri, 14 Aug 2026 at 15:55, Manuel Ebner <manuelebnerli@mailbox.org> wrote:
> Add the required version from changes.rst.
> Add code for comparison and print in colour (blue, green, red) depending
> on the result of the comparison.
>
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Thanks for your patch!

> --- a/scripts/ver_linux
> +++ b/scripts/ver_linux

> @@ -89,9 +92,17 @@ function version(cmd,    ver) {
>         return ver
>  }
>
> -function printversion(name, value,  ofmt) {
> -       if (value != "") {
> +function printversion(name, cur_version, req_version,  ofmt) {
> +       if (req_version == "") {
>                 ofmt = "%-20s\t%s\n"
> -               printf(ofmt, name, value)
> +               printf(ofmt, "\033[34m"name,  cur_version)
> +       }
> +       else if (cur_version >= req_version) {
> +               ofmt = "%-20s\t%s\n"
> +               printf(ofmt, "\033[32m"name,  cur_version)
> +       }
> +       else {
> +               ofmt = "%-20s\t%s\n"
> +               printf(ofmt, "\033[31m"name,  cur_version)
>         }
>  }

None of the above reset the color (using "\033[37m", or the shorter
"\033[0m").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
