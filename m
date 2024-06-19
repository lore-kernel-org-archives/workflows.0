Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D06478C62
	for <workflows@vger.kernel.org>; Wed, 19 Jun 2024 08:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718784535; cv=none; b=nrBqX+F7QP09a4CbFY29lpzQLbUjeDW63BTly6K5LXBaOWhqa/ItsPUaMSi+3hFPKPfVlt1o2WQTIxZo3E9q0OtNeWdqb2uToXcalSSO87N8zHctUemTFG9jpJFFomOJkJz0s/lEBkD/Jgmf9irUk4u3MV6by0J8+oG605lajD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718784535; c=relaxed/simple;
	bh=vl9KclTpnM+SdGp+CrCX4wdBrh0WCaT2cjnS1mhbu6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FY2WBPEysR8U6nDPN5APytyqFP15ILwkGOy5ccjlWm46HLJIgjIdWMbvFeY30K2gSHjChHcMIU7ruQjW+Rt1fQlfEcQnn+oSd0tsHU5O+xkxPrInisM5R+radfEspMxyFkH6yTrVDPMj4OY+dbEXYqTjjzwZLw3STY7YWOkrBS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lU0wTnSP; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lU0wTnSP"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so7691076e87.1
        for <workflows@vger.kernel.org>; Wed, 19 Jun 2024 01:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718784532; x=1719389332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aCIcbRqN1/jGnE/uXHAlTtP9P6llAMOVezx7CUwbZqQ=;
        b=lU0wTnSPMAvIuSKq90Jl8+OhEO8j++q5qM/w6FDMiudR/GjbHvlIhTAn1RIIEFkfFv
         NuIxvQ+H6j6aowar2gU6DQYkPdkiilBDtt8jmnP3Zj977IReuhaEskXqAp8sx71CpRgH
         EhZJQKvEHHjK/V87UnbS9dxo/4/gmIXPFYSx68DacpM0oTHuooniaqhmOg1slPfcUooG
         Aq5fAbYuwjoLbfpTxf30Kzvq5RNh8Ol3HSQwvFPSQBPYkLkCkFpc6JFQpx3R1Ta5j+xv
         YxhJFG3sWoIVn14V8NOL1rXW7EwebWAmBzHWcnndfOg5YFbmdFfkh7yCF9dNEf4HFnPT
         XfWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718784532; x=1719389332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCIcbRqN1/jGnE/uXHAlTtP9P6llAMOVezx7CUwbZqQ=;
        b=tYfxDGOi2cG0jTrtkZ1VdHeD+CrubegiVDCpxTmwwQPGLBXaYv6M6MmOQ+i/Q84PcC
         nDFG7u6ynuQK87iB8HrVK2fOrWVU8wvRD1tUl5V38Unm1Sb/6BvfiLrIBc+Yp68F8eRM
         RaDEQwSU9EtER1SWaKfu+nW+8gu+gagqbbC8Bu0d7hU+UjU7ZS1bsLGLRSYpiF1CZRQg
         lrTS8NRA0UNd2pr+VArtfqQXvIzmnwE6heeR2SVLcjVFF7hRUlwbC05aj5hG5MOmrsIH
         5CqRjRiEfLfxAc/7InA+sOVYvnlpcrGcLlHPPG7F2KXceagH+yZvYKLT78gffQv48JxY
         Gp/A==
X-Forwarded-Encrypted: i=1; AJvYcCVSrsUBcCtOSUFLhFk0jiPee4btRDC2HYiqhv/Xfc7i2+lVbv11cuhZVkKJ+gEbV193TGqhDbg1ZByhEpeu4X/e76a3PcWFitNI
X-Gm-Message-State: AOJu0YxTXinS0JQtIywhGZmSQm5wyUmmuks3QazLeHzKt+NuBvXcnqFz
	zpJJvX20VdOFbkwelZLaxRv/RAPjSKeCUWGALEegxOrgQYdVmiObPTcZCYL1+5w=
X-Google-Smtp-Source: AGHT+IHzpaORTCZz1/7jsEDBtxbwIYMBPRLfAyWcTVqZGOfG4wD12iOFalcqhwT3dzksgJh+y2ozKQ==
X-Received: by 2002:ac2:4578:0:b0:52b:85ba:a278 with SMTP id 2adb3069b0e04-52ccaa62111mr841920e87.31.1718784531869;
        Wed, 19 Jun 2024 01:08:51 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36229be908fsm3478277f8f.38.2024.06.19.01.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:08:51 -0700 (PDT)
Date: Wed, 19 Jun 2024 11:08:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Carlos Bilbao <carlos.bilbao.osdev@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH 2/2] Documentation: best practices for using Link trailers
Message-ID: <aef741d4-d6e0-41f1-8102-c63a0fc5d7e2@moroto.mountain>
References: <20240618-docs-patch-msgid-link-v1-0-30555f3f5ad4@linuxfoundation.org>
 <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240618-docs-patch-msgid-link-v1-2-30555f3f5ad4@linuxfoundation.org>

On Tue, Jun 18, 2024 at 12:42:11PM -0400, Konstantin Ryabitsev wrote:
> Based on multiple conversations, most recently on the ksummit mailing
> list [1], add some best practices for using the Link trailer, such as:
> 
> - how to use markdown-like bracketed numbers in the commit message to
> indicate the corresponding link
> - when to use lore.kernel.org vs patch.msgid.link domains

You should add something to checkpatch to complain about patch.msgid.link
URLs.  Those URLs should only be added by the committers, not the patch
authors.

regards,
dan carpenter

