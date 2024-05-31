Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA3F74050
	for <workflows@vger.kernel.org>; Fri, 31 May 2024 08:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717143560; cv=none; b=GuOSK4nreb/AeJjCw645gNU/f3itsVfnHbvUEUzYDljS7MNHpcaa97bxi5KyoGRjr16HHc9yRnoQgnFXxZ9RvKIEbGzJYKRLMLGw7rGnw2KCox2FTO3uVAm2n7knORYTRJlELA7yFdTFJjVtPuRD6rIg5SlyMmBNHqC3m2/swIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717143560; c=relaxed/simple;
	bh=VIyW05HPR680xsdAyc17DLcbKTw0GIh7anAY56xOnYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbH7ORGjBP+yhYIzI+1cd87ITiPVeMZ3ry00JsT5QezONiDaFOvVwTrXj4C/T8dZj8kO2lXffH4RksWelImQIMwjpPYl59B04YRgWTLVoRa/OUK/D4B152hUcBee1XMQGmxUGxmcS6CdAoGSRzUpaOnmhSusBttUTb3ObAWVD4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SLT05/e/; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SLT05/e/"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52b7ca4ad02so1838067e87.1
        for <workflows@vger.kernel.org>; Fri, 31 May 2024 01:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717143557; x=1717748357; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
        b=SLT05/e/ZQf0BRCaC2enKdtih9mT+wKFUhaeG8VR29vrG3eun6Ye5lcj9msi29OIVk
         6ds/+iozABXm23zSWd+g55C/dYKjiiT2IDu9/Wk9rh43n8EdnomUVRlt9nwRT+cNTPgn
         Ma010g66Dw2bqRNc2uXHZoxzX3gC0mpxwYg1tm0PgHBKs3EGlL4dfCLxK38X29jL2dt2
         C4rjMS+h+Y+rwJnmUd75isVDjEr2ON2sAl0lc6O+QgbHH2RrniugNSU8EabrQlxEiXp5
         Kclr2pfB92u5DD2sg7sC5yZtD9o8cdTkft6HrjTATSt1PGTfT9V4FTllafqge5ydestW
         e5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717143557; x=1717748357;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ko3x+z+oeuBeX+MUT+r9pNc7Ha8KawJ7XnNk7EBTEEM=;
        b=DPLwwrDBh0xlUR+xZMrYulb1UzMBN9qkd4gosHc7SvFUtq4H5vYvEUkmUpxMr45OPS
         yliLP1ecWFqnfVk4IoR20vx+6vmPkmTROWplv2JMNiEUn/9KbONy5nSB9I9WoT1KaI5+
         /JG9nMTAqiC9Do/KZh5ZPVHjuiFK6U26ZStX5ARtG9YWjbfb1pZCeVTRbv9NXdrk7WD9
         zCou+fFu0tFJSDudH0PM33BR5Lq6BsITQr0OUoDkZQqhOaAFM6/eT70aW2AW9neWWpvK
         Nj8SdK4uDxeWrzrLrG87RZpt4pr9puyeVDxwN5fUnNlgpzTL+UqUWMQAGBO7nXWSA2D/
         49iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiJLryQTNGpM+ZYJd/kfSWM1oe+dt+BdtwS2ycxSrWySIWXEsShznX44EVZj/F2w2L0jV4sau1op7A78WnGPSLEU4OAZBdCgCo
X-Gm-Message-State: AOJu0YxWwASL801univVFBse0xCWZR98Il8DKA/ZZ2Ds3NTR0vuZLiX6
	N9S3hqIusalj+oqkmLWIBaxM5bsVY/EGIOXOLcyTR15JHuCkxy64ZcB/hOuKDFg=
X-Google-Smtp-Source: AGHT+IHKOALBvpP5h0AiQmZTmJVgPq3q/lJ+YsJBLy9b7uGY4oRPAaR9D6pdKC0bm/RzqJYNRG+OLg==
X-Received: by 2002:a05:6512:70:b0:523:9789:4c8b with SMTP id 2adb3069b0e04-52b8957ff6cmr664063e87.5.1717143557411;
        Fri, 31 May 2024 01:19:17 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52b84d3450bsm254800e87.45.2024.05.31.01.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 01:19:17 -0700 (PDT)
Date: Fri, 31 May 2024 11:19:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH] docs: document python version used for compilation
Message-ID: <dz23snvzifgjc5dktv7sckkumpudjkumf65bc66eler3xm4atf@37nypjcwyxef>
References: <20240509-python-version-v1-1-a7dda3a95b5f@linaro.org>
 <87o79faq4a.fsf@meer.lwn.net>
 <D1N564M136RW.3CRPYTGKMW1NP@gmail.com>
 <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVA7MU8LMUW6rR=VWtCDs8erpKgx30woL5eUucRYiK-Fg@mail.gmail.com>

On Fri, May 31, 2024 at 09:33:12AM +0200, Geert Uytterhoeven wrote:
> Hi Thierry,
> 
> On Thu, May 30, 2024 at 7:07 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > Alternatively, maybe Kconfig could be taught about build dependencies?
> 
> git grep "depends on \$(" -- "*Kconf*"
> 

I'd rather not do that. The driver option disappearing just because the
pythong vesion is incorrect might be misleading to the users. Anyway,
with the Abhinav's patch the issue should be fixed (and I'll take care
not to break it again). Sorry for all the troubles.

-- 
With best wishes
Dmitry
