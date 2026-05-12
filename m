Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D44346AC4
	for <workflows@vger.kernel.org>; Tue, 12 May 2026 15:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.133.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778598335; cv=pass; b=dFUUgeNjk9Ju+LKE+AIsAbF0GprmUb8s2xFaBfTdTrwkMHzUcPrkmAouD4efCwe8miVwb5DC+JWtqxv0DONpmQ9dWuRmcY1KU7EnH0qknyLh2vxow28KIraoJ7Qx/FKAwDeiiWpaGuTG/vtrHTIaCb3UYNe0PT1bC/qC7Fo7EBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778598335; c=relaxed/simple;
	bh=Yc9da0wDU/GeX1+XjMTk9av+bBmiHdfCu0Hae/L1BKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UBpC/xCgexaqdXxX2FQZ7WH5kWjGlBkcqURDLa26T7v4I7y3I6znd7BJDVa9pWxn5QQ3z1RjeKhl8llfYcB5LEVytdjCyiubGh+DsmBAn3wZhrqwRZijQFGgCGm3wnDz/xENaZcNLOT9O8ac3li3wEPY1eN9rrUktfePvg51Z30=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OIk0ODmo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ewWkVXwP; arc=pass smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OIk0ODmo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ewWkVXwP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778598333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
	b=OIk0ODmod+xgaYuaNG/bFYgQJIr1t+3ZRD9QjhWKF3/7r2T+1StzPTgeFVbu92uUy7iC8k
	51b70ETQ4lsYhMUhifgbabM/JP/O+A5j+QCaHXiJJMjVCyrx1TcSdoyDZR4vlU01ahmOX6
	0JoPDxiyswedR+iWc/mQTHrWJK2KrM4=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-e2bNSoytN_OPZvnI922iDg-1; Tue, 12 May 2026 11:05:31 -0400
X-MC-Unique: e2bNSoytN_OPZvnI922iDg-1
X-Mimecast-MFC-AGG-ID: e2bNSoytN_OPZvnI922iDg_1778598331
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7bd795b6288so114453447b3.0
        for <workflows@vger.kernel.org>; Tue, 12 May 2026 08:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778598331; cv=none;
        d=google.com; s=arc-20240605;
        b=AQBsGXEOCX5wfzmP/8SER4WYAXzIoKgIDG13Ap4X2a2l+XS35jnzUr9xDBlIHNcuxv
         H1w76ZlSxj7uJmqCwYdd9hdc3171IATYPjRZBil1Gd75T7O1tOPLsTDZ0HItkoZru2rD
         c4zx+qLElpRVVrXZJp+m1cgl4J/ySG1POr9NSSfAYLLTDNr4z6B8yiJ5qBKI+73R/lo5
         TRODlCiYbCe3bQCwXUlhEO8eiQojgbD/ndPSBMeueHi1YPtXUso73C/Ei4j7qWuc5KfV
         0rK6rGN/1tImL1jCaH0CPaln7q9vRrC5d5/D4tQK2qaeKRAx6PaZzjmP4sYqTGhWewif
         /C0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
        fh=H5mr6vPhyDMsysd0boRwlZ5ucNGIPAqR9mWHPxK8Vn0=;
        b=Und6wxhcZERS8ewxxhTX3ukQOHnWn0yFV/U53BhtLjk2R6LaW3UWrvAJMfSjaQjIeg
         QH4DDeNiXn3xh6JmuPkAAtPRJ44VzqSibrPsVObbMOe1wgo2QYvsSvVAgZ9lCHgVjQbc
         ZKHsSkPU2kTF9rKxO3a+1d4820VXZ0j1nfKSJ1af/iavbYs20wZkja6Ics4piZlDiGvf
         nk2vvAgyiz0tWg1DPcLzK0TFggWx2Yh7iGk2iZyfiaBMzEPGT+aeOg2hQkAWTY0yaGW3
         3dPlpZJHzZnQ1uYa2QuPxkU72MXCRERH6Mgy/j3kFijej3w45XYvSmSv9tt5CshCIY52
         tGjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1778598331; x=1779203131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
        b=ewWkVXwPkmCZ4XFrslMbpJ7dm1h7H9AlNeXjD4q9j5CcOAw5wxZyAyQiiUl/6HUkyb
         5CAx7JBrlIfZf/BGNlQfXZ+al6czoIK0sCFwoDp1QosILvQ4UsGQ5jk9kRs7n2U6b2a2
         H7DcviGDXUwq1RZS7elQU8cY6hiQkzUEmTOVHHDZUoUrAOPh9cKZnq5QHYOxbVLHmlOy
         V8J/jTHds/l5BMAcgyySDS2G6RBmE26ROVALfA155CQw9Dg4q2cbBvWvpVI3mTVW5v3a
         IyOJjoTjj9dtYQirRqZdbSICf5wc+NphKTtAOxyB3O1OUi33HaBsdZuMQpj/dV3DobBG
         CQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778598331; x=1779203131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2eX0USmLShQsb/8DMQ63vXaSE/VT5r1TpahlVnwh5Y=;
        b=TRNodn+qKicWD3CGvSfEs52VScB2C2J0FzrgHysvgQoQN3fC4JEo0Pye2E8ty/mHas
         jv7p5iPbGAx41H7vewxOsAydu2m0w0dzz4zYKsJv43g6COvaErYCwzPFq29yGG7NtrVA
         1uAafBpfWgYwLetd8qTHnI81U4Dg/LK19s9TAuJIWy1WkwVf9+8oQVjw0BVmy+noxLyC
         X9e9gei8dC1HyLE9Tzz91ul17MsC6varYqI5LWoChpmC1CjVostCZvwlId17eAC6iy6V
         syYoQPTcD+ScxD0/vuwMtWUGKuEMQX2WX6buqzaq3rcnJki037psTjEZYLj+Bhmco467
         al4Q==
X-Forwarded-Encrypted: i=1; AFNElJ/Pq47yspbjVCthXxZG3p88iUpDRIaEOz8dKXurKcv/PVdh2NkFtxRPGvrdj8gclwekMuy/3jwHJ9E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1mOVYlUFm5Tac5mLLHuPSWJaC4Bvz3QdQSWo3NkrQcBnLl4VU
	TxIKLldlJS+C7Rp5J7ZRmwzZtS8g/yII+ofTxLM6wEnKD64H665RxcJXURQI359+STH0Y9Mc4rn
	9Q2PKBQRis5MEpbfP8r8Fwt9IZMFFMyA0F6JsMVvVZ00llSmxc0skz5fVUuD4PcQd2KqNaRhhKc
	DwVBPzSJlrQuJQtkQFbB/Ku72brNKipvn9qouo
X-Gm-Gg: Acq92OFZ+G7sSQ8gbc0P8KkARsHNOxQ3xaSftf4/oNkyZcg2Wvb0JtXP9sooC+Kyrwz
	PEi5cFIMQX8F3hLQUG2akIyqPKJcrceBqx6BwisZT7ZCHco9wCvuwsh/GFIKXJV0wVTOqLttsmI
	bhknXdc6wBfgzk6hjdW9aAuvNldQmxLU/I8kR2TlZqgWzUpwc0A4e6xv05nFbGwmsB3dGD2/Bcs
	afYkw==
X-Received: by 2002:a05:690c:34c9:b0:7bd:6a98:58d3 with SMTP id 00721157ae682-7c50f7cdf32mr36554607b3.18.1778598331013;
        Tue, 12 May 2026 08:05:31 -0700 (PDT)
X-Received: by 2002:a05:690c:34c9:b0:7bd:6a98:58d3 with SMTP id
 00721157ae682-7c50f7cdf32mr36553547b3.18.1778598330230; Tue, 12 May 2026
 08:05:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508-kunit_add_support-v9-0-99df7aa880f6@redhat.com> <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
In-Reply-To: <20260508165203.1cd1b27e664754d18dbea899@linux-foundation.org>
From: Albert Esteve <aesteve@redhat.com>
Date: Tue, 12 May 2026 17:05:18 +0200
X-Gm-Features: AVHnY4IjDWzPTwv7Lf1EJ-4smElfrpc1pe5LEGC8untQsvEPzH-woMO9H8PAPck
Message-ID: <CADSE00LNoc8KgVWR=7Va-Phb2U9sDzS9wntWckDFm66Uz89bnQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/4] kunit: Add support for suppressing warning backtraces
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	dri-devel@lists.freedesktop.org, workflows@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, 
	peterz@infradead.org, Alessandro Carminati <acarmina@redhat.com>, 
	Guenter Roeck <linux@roeck-us.net>, Kees Cook <kees@kernel.org>, 
	Linux Kernel Functional Testing <lkft@linaro.org>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <error27@gmail.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 9, 2026 at 1:52=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri, 08 May 2026 17:02:44 +0200 Albert Esteve <aesteve@redhat.com> wro=
te:
>
> > Some unit tests intentionally trigger warning backtraces by passing bad
> > parameters to kernel API functions. Such unit tests typically check the
> > return value from such calls, not the existence of the warning backtrac=
e.
> >
> > ...
> >
> > Solve the problem by providing a means to suppress warning backtraces
> > originating from the current kthread while executing test code.
> > Since each KUnit test runs in its own kthread, this effectively scopes
> > suppression to the test that enabled it, without requiring any
> > architecture-specific code.
>
> Thanks.  AI review has a bunch of questions:
>         https://sashiko.dev/#/patchset/20260508-kunit_add_support-v9-0-99=
df7aa880f6@redhat.com
>

Hi! Most look like valid concerns/issues. I will send a new version
addressing them then, and monitor sashiko to ensure I clear
everything.

Thanks for the link.

BR,
Albert.

