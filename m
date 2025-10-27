Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FAC1B040D
	for <workflows@vger.kernel.org>; Mon, 27 Oct 2025 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554073; cv=none; b=k02G+DeIdwbK6jKK8gxgTs0X8HTZ0wRs2O5Oq54bRsAKn8OQEXJAPusa9bOB6sl7t8RNOt+RPt9I8jsKTgpW9TR/6o/xZpWMI3vgVj/VNpAOFYjXgUE0v1TobOIqUDN2U0Rj9ExjCD8g0hhlykTn2eocCKolrh4j1/yRgu/TbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554073; c=relaxed/simple;
	bh=hZTN/tQMYZInh7JvxfdJgJoSNB55wm3j6jMjFgi+HkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnhGzAawR0odYiK35e6KMzcGtji2gSG/seS9QMerdD0w6XEDxS+uKApqnBca8puK5NAhmCgKbNgI4B9RnWtnz3hAYY2lGBaYJgP1UL2fwadqMjIhwwImpiTw4Ba4eBMA3Uqr/FfOHB8h2AeTNlIO4O//t8DHDrz/x6w+7mAEOWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyLYAXnn; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyLYAXnn"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b6d6c11f39aso587870566b.2
        for <workflows@vger.kernel.org>; Mon, 27 Oct 2025 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554070; x=1762158870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXqA2AyYDwMAn5NeiBjETLweOL3QhYSqRjqxrljQDYI=;
        b=kyLYAXnni860iyXZipirj1ouWIpiOII1jtdMfjXMlErQ6dOum3GjUR1FmWlO51eCaf
         ooziWpmNBHa6xn87D336Taz6sYkrjM+ClNFD3FNo7aM/VUs1r7c6avi4YIhAVhgYCPEk
         uL+Mk4M1ARpwbIbbYlc1B/sof3Bf3eJ1buTuFf/xsM8AyBXsA3ZiIKmL46OkJpHARTml
         2HAt85RckGpaqPqYaU/Di8gBH8JtTf23CEqF4ZnQeJbtUdIbYsff5Psolv0MCInD2/cG
         NRdFLB9gqa+D9XoHOURy2+xLIVVp5QbP6845dopJzXbFaihzSDEeKmQo6nkMh3SSv4oa
         FRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554070; x=1762158870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXqA2AyYDwMAn5NeiBjETLweOL3QhYSqRjqxrljQDYI=;
        b=W3mmzbCfHH331mvOOr4CEWR0Ti+0ubAXH1P2pq9XiYOWbowxDhM5UBbMM2emJDGu3k
         gKMSfEXa3hyPApKqlAq0A2uo8lq2ueX0EfxFwalna3Bj+TTKQ9gK3vSM15y6xgE9np00
         z7/e+R8xnba/KA5ocQ7E5sVssyHP0XxJDCEcfO9xXSmO8OPwEg7NLwyNga13SWfNSazr
         U0hR64PP3hdbgKRR57XPdE87tViDuCotTfBBgS4rWUvu/UlUDbsNGpk4bQM4iEw6bOaP
         wh7XVEwhnIlAgXmmeJnOZwSSSmpEpHnErfqllbX1lvpWvTQlUKHw+jyC4fLhWC5aS83p
         TMVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD6edJ1OEquwbIxzkYQi5sdGqYr6eZ2SUZ1M/TG1FHWPynjpoZqMoDskL7KBZ65n6uu2qWcOv5ss0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVE6KVmdxo1QnvP3b6lBQyon/FESKuREteJfecKwmSBNszM30o
	9Ag0y/kVeoFmBbd/84sclkfF94Z99fUbYcuDu9LEBNDEvb9UNqvYid6wrvGcSPr7pb+79Q2PNkc
	QO3wRksJhBd7jKGCCPsdstAqCtJ38lRo=
X-Gm-Gg: ASbGncs6w3laAhLEQmOrC8BHB7vDcAdIh+Q1pSSvUsVIjJJJaQvM5GL63Ee0bbzCrdl
	hcofmw043Cc20rh+buZKRVMBXiHgj/pPbm3Wc8LvjS6tigFQob5Sp+EiWqV37GqxEjlFwerSJkc
	csPEkUDhG8GRaPFyRFGtTGmUVxXUIRhp9vXgDT1AA2lhrJk4+Ike3zOexp/VeAQxx7kkK1FCUY3
	wLxAmox2n4F5ooraihsDP1m/mrfFJqEzgG29AtTE+wHwxgFebksqy/jsVxbCUxo9sUMh/UfU+vL
	oYnSYJgo43//PrlUz0VuHATRXMoLxQ==
X-Google-Smtp-Source: AGHT+IF4Ku7VBi6Rz5YATQmMp4K6m21OtDlsrRJ8R6TX/Zwi0y9zuA5CLxTmowv0xMLnRyevU+7TIZF7WyaAwQdIbqQ=
X-Received: by 2002:a17:906:6a12:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b6d51aefb9amr1645192766b.4.1761554069622; Mon, 27 Oct 2025
 01:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
 <aPvAm1E7CvQfOIuS@stanley.mountain> <81e6af8eea5b0399d1685797d0ea6a6ebc273270.camel@gmail.com>
 <aP8CxkXYAitKB3vx@stanley.mountain>
In-Reply-To: <aP8CxkXYAitKB3vx@stanley.mountain>
From: ally heev <allyheev@gmail.com>
Date: Mon, 27 Oct 2025 14:04:18 +0530
X-Gm-Features: AWmQ_blvkJ9ZtBmHKBSTV_q6E3sXqzi4cxX3zWvk57-nTx4mfsifVuvdEYK6e1U
Message-ID: <CAMB6jUGEJeOVKUEpeFosBFA3QsQk3kgdt_e1EAQJi_yqJp7H-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hunter <david.hunter.linux@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm <linux-pm@vger.kernel.org>, 
	dan.j.williams@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 10:57=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> > General question about the process for my understanding:
> > Is checkpatch run on full tree by CI or someone and results reported
> > regularly ?
>
> Newbies run it regularly.  Otherwise it gets run on subsystem CIs and
> the zero-day bot runs it on new patches but it will report the old
> warnings as well under the "Old warnings" section.
>
> > My understanding was that we would run it only on patches
> > before submitting them Or we just run it on full tree before adding
> > new checks to understand if they are catching real issues
>
> Eventually someone will look at all the warnings.  And probably it's
> going to be a newbie and so we need to be careful with warning where
> newbies might introduce bugs with their changes.
>
> regards,
> dan carpenter
>
Makes sense. Thanks!!
---
aheev
