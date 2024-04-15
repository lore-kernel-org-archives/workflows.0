Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D6680635
	for <workflows@vger.kernel.org>; Mon, 15 Apr 2024 16:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713198403; cv=none; b=Dgb9VLM7ZTD1CKplUGVkxkj8APUKCYbjKMP1vtrNBVg3kNAk7cDLQ28DFZByANC5vnKadJF3PHblXOClC2mklK+gN5bG6NxUO9rHr+QuS4YbRtybWdvCFKcuyY9zVKqnpZae6rKWA72LGo+ZF69SRdbQB+4kX3aSUPwFK+TPuF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713198403; c=relaxed/simple;
	bh=TPnCz2wIas6s6nm4zl4kHicnrqDlbc3QFZUPUtZbe4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q8V4NNsOCQhfKUMQrNZU6grsHlGkJoW5F8Ru0MtgeKHZU2oCbfnZsadk8m0KjNtuQFBhgtriiR+Jgdh5uSwp1Twjw95Y1C04l5jYf7e2KlDg00YigfLb4Cw6kNsXz2uOZMfCdbtiwgY9tL+jhxebrpg0YBo7f1rJ4sT+/cOBTjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nZ+gxhY1; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nZ+gxhY1"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5aa1e9527d1so2522479eaf.1
        for <workflows@vger.kernel.org>; Mon, 15 Apr 2024 09:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713198401; x=1713803201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QKHTfr0tvl13h4ZA+OR/lP9gzZF3Fnqy/imumDFRLcI=;
        b=nZ+gxhY1m3mhD3UrfIhn5CDg7S5qCFXvhWlgNO9Ckv8PPTkFmJCwMhQUx40+PyqJ56
         /uszDEHZoTFaJtOn2StgYoTtBaU84GPDXS1PwbKzM4weKqUPA66n2nGR+KzKmOtIEiCM
         v2O/sNCsCre+cgSsAvEnZBHZtcskEPOjTbzFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713198401; x=1713803201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QKHTfr0tvl13h4ZA+OR/lP9gzZF3Fnqy/imumDFRLcI=;
        b=L66/Hs6i+qpW3K3SfDc/RitE11MzM4omKTpylhClyyArkp9ohro267iKCg8xIa2Qat
         O5X+6rMI0RpQApfV3/r5ekrI5eEWE4jkiXJoPjL2n0GbbmOP41vrL8lWL9sq0Ch31wo1
         kW2nYnAATHnqKJ8B/FYSK2N/Ez+p1Nev14tctaHscqoVSfWmfyQPaFAKp6RZ1eImD3zv
         kfEqUGDqo7cjGVDmJ/3NyTnUpQesB8UlHokQuwXh5/ViEvRnK4c85u4rqwtI+U2XL/lm
         sF1uZKQ3M5d7gCmwznyW6c1PdK8ZvjRm0HxUHE+8GD8sd5aXs6y3vF2mvn3mzJSBnRq6
         gHBg==
X-Forwarded-Encrypted: i=1; AJvYcCVTPeEZlm6RL14tw1/rtQfcCLwhXgVr2fbfmqS672LVe6LtdblTszaAfaJzJ6rRrPNG2l3Qmgd25XLJMiTrIl1KPLru5CJkjyOW
X-Gm-Message-State: AOJu0YwxgvDXDuXn4fwuEJDlBOJwNjJtg9RWia4vjVk+J2ZagrJASzzN
	n+6ru9Dj+53ePUEjVii+8I7BINZx7wD8UJMvIt6tlybZ+z3XJBDmuY74t0kPLA==
X-Google-Smtp-Source: AGHT+IG5foknaEEd3MkXk9+LN5r3/huMB4/LsTYhpQfavkLppvPRN0r2oC8b83xw/nAjf+NuBYciog==
X-Received: by 2002:a05:6358:c695:b0:183:e8d7:6f58 with SMTP id fe21-20020a056358c69500b00183e8d76f58mr7637642rwb.32.1713198401272;
        Mon, 15 Apr 2024 09:26:41 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id x124-20020a636382000000b005bdbe9a597fsm7238801pgb.57.2024.04.15.09.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 09:26:40 -0700 (PDT)
Date: Mon, 15 Apr 2024 09:26:40 -0700
From: Kees Cook <keescook@chromium.org>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Christoph Hellwig <hch@infradead.org>, Alex Elder <elder@linaro.org>,
	corbet@lwn.net, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: coding-style: don't encourage WARN*()
Message-ID: <202404150919.042E6FF@keescook>
References: <20240414170850.148122-1-elder@linaro.org>
 <ZhzgTeEHFF19N3UZ@infradead.org>
 <2024041544-fester-undead-7949@gregkh>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024041544-fester-undead-7949@gregkh>

On Mon, Apr 15, 2024 at 10:35:21AM +0200, Greg KH wrote:
> On Mon, Apr 15, 2024 at 01:07:41AM -0700, Christoph Hellwig wrote:
> > No, this advice is wronger than wrong.  If you set panic_on_warn you
> > get to keep the pieces.  
> > 
> 
> But don't add new WARN() calls please, just properly clean up and handle
> the error.  And any WARN() that userspace can trigger ends up triggering
> syzbot reports which also is a major pain, even if you don't have
> panic_on_warn enabled.

Here's what was more recently written on WARN:

https://docs.kernel.org/process/deprecated.html#bug-and-bug-on

Specifically:

- never use BUG*()
- WARN*() should only be used for "expected to be unreachable" situations

This, then, maps correctly to panic_on_warn: System owners may have set
the panic_on_warn sysctl, to make sure their systems do not continue
running in the face of "unreachable" conditions.

As in, userspace should _never_ be able to reach a WARN(). If it can,
either the logic leading to it needs to be fixed, or the WARN() needs to
be changed to a pr_warn().

-- 
Kees Cook
