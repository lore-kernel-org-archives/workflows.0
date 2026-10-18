Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D9435F184
	for <workflows@vger.kernel.org>; Sun, 18 Oct 2026 06:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792304531; cv=none; b=nXdN466o98Ck/nmw6lx9otbD6Vo0W89pphWgn9ZcppfBMb4IAiPxkfI9qkogiGZhiFxthiFQiy36U6CjTPpQrenbHQNYL0fhMaExjbz/N8RZfFIJUm86Mr6LBupbf3eo2VSBGUbBpquBrBiKyahNsIQvVNTM42R3B60YnbEHnhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792304531; c=relaxed/simple;
	bh=y8F7dXJHndM13xZhNRXHWKnJACtvf/G0EiIhGDJJtWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uVgYR5yXEVJUKTJlqWw8dLoMtuDb6jImc6ggi/QnKDbYq7AD0PrNH9zrk0ZDbznGBwXBApfm50qFG+8bzzHmaShdMAEojFdeNy3uqv4WjZRofhvp2/dhU5FVCrQ5GG8PkPVsaGBwub5ABSwKT+/6uG3wQ+bOUhfOAXnYobmN5+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jpRZ6G95; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jpRZ6G95"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8874539bccbso625012b3a.1
        for <workflows@vger.kernel.org>; Sat, 17 Oct 2026 23:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792304530; x=1792909330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ImNMEDi8oPrWIx71COnlaNJwSBMr2u0fGsfEGtTKVc=;
        b=jpRZ6G95dVbCisuXSRF1PGL7VWpZfc7cqqzlvnta0wcWdu7mkYPlgmpooLCj7yNDcV
         +7JooiXIsgUqoeARYKEPCsesEBLTcQwBq7pDTavELZTRJpSJ9zNNz3iKaOCOVhmJzX7j
         1+z2POJbvLq5itzyfI8qpw5syO7D7robQJAC6nV9vLvATm6ekntSHSo2nXI208gbI0l6
         cQisLx1Am2Z0t6Z1QjAoSqVZfIF021GMN86X9zDmUMXwHgsKiGjxrWE8JL+9mIgrHtOs
         Bad5Nr5MDW5i4lqaRCSRkHM3PqyUjjjDx+lFZGp5L0n1M7kJQFrTEQoDGfyncVS4H6Sh
         GhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792304530; x=1792909330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9ImNMEDi8oPrWIx71COnlaNJwSBMr2u0fGsfEGtTKVc=;
        b=S5Oy20+BJUsKQ2Xyn6uqCxkTHC3NBLQ02fkfy2kbIkfBw1eGKYt24TushV2ZpZGMhI
         7fNkWEK7KGwy/5/LLrMNWArbo1JPzOJfph21FsGPsM1OL94AYSGgyocaAjyR/brbmT4f
         rvZAuXhc1upPJXDn3WYg+FmEfAX6YnRb34NNDtVqaDezA2p7hjYvpS5rwQSRq5XL0Nrc
         lS4smV00ASf/lzpEpZhOn/KFjaVbO9lUx4hkcxUaRGOiPe42S71eaqz38uv6l3hDsLvl
         he2ol6qH0QmeKE6I+frZETtNlkUaVXGLC8AuPcAkG9Lw1rLhhWHgiJ6GcIM0lTPlxUl3
         6lpw==
X-Forwarded-Encrypted: i=1; AKwUvBwiUqwVkK+wySTK4mm7n03jC/Aofo8ZAQrvlCAGzN5xiqLAZj0nQr+fBelWd1YXKT6OGLaaAZ+hCss=@vger.kernel.org
X-Gm-Message-State: AFq9FYJeLONWDZHxRR2xW1/1G+2rDIK2DzJDoZuWx1NQfqdl/GXB7hnj
	m/Xq05FQ8vGz2Hdb+mLWeI7kB9IMIlCTl6EnBUDqDMTsuVaGvFNjfMTt
X-Gm-Gg: AYBFou3c26T+dXmSFrHoT3Ow8R6aYmCGEkOUt+LuDb1+OEBzVkCcwA3XHORzeWM4JJn
	QSo3+J5aQhDplkhiGbvAZh29HaB4HL2P/G20phbLf19Yb6FckzCG4uchDLW7n+Cvc6k3Je3m5WX
	CZ5MZ1/hGu91KDUzBDxEP/GHNAF6R7oN1KKuQF/k+PaU1RhmU4zsrzvtUE5Hq4YkDuuFN8q5Z6p
	cp+zI2Ig1bqdi/qRaNQMUO8xead/6VwD/dsJk73BWHyfS3HuihgB49ESByy8PfblfWxwSLr2cMU
	KqQwVwhiAiEiGRx3YsBZLjLEIx/5eW3JqykcSpGPx7+/FdwbaIm7VxwkM7tiyumU7v35tMnAFBB
	OupnfOOJ52wLSUMopfoEsCngvzFf4ggR04ccXpKfhBsHNMqImWHBZ1zcD2zJJoSEWSkdSNTx3ek
	EroKxed8CUAWIqvRZWDLEJ/a/ReloUnboglc79Voe6qcWS6h8xyFi6QBysu+Lkf7dnjGGe075Ex
	VxFHCHlcL2rCOYqesKqYdd9sY4B
X-Received: by 2002:a05:6a00:1707:b0:882:ae75:b846 with SMTP id d2e1a72fcca58-8a04ac2a7e8mr3453484b3a.4.1792304529741;
        Sat, 17 Oct 2026 23:22:09 -0700 (PDT)
Received: from localhost.localdomain ([222.254.197.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a05d4b04dcsm584738b3a.16.2026.10.17.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 23:22:09 -0700 (PDT)
From: Nguyen Duc Thinh <ducthinh100812@gmail.com>
To: Weijie Yuan <wy@wyuan.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nguyen Duc Thinh <ducthinh100812@gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: use git switch to create branches
Date: Sun, 18 Oct 2026 13:22:00 +0700
Message-ID: <20261018062200.29256-1-ducthinh100812@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <ardqGdjnd7kC1B-E@wyuan.org>
References: <ardqGdjnd7kC1B-E@wyuan.org>
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Sep 26, 2026 at 14:45:45 +0800, Weijie Yuan wrote:
>     \$ git checkout -t -b my-topical-branch master
> +    \$ git switch -t -c my-topical-branch master
>      Branch 'my-topical-branch' set up to track local branch 'master'.
>      Switched to a new branch 'my-topical-branch'
> 
> @@ -882,7 +882,7 @@ notice that it will have the ``base-commit:`` trailer at the very
>  bottom, which provides the reviewer and the CI tools enough information
>  to properly perform ``git am`` without worrying about conflicts::
> 
> -    \$ git checkout -b patch-review [base-commit-id]
> +    \$ git switch -c patch-review [base-commit-id]
>      Switched to a new branch 'patch-review'
>      \$ git am patches.mbox
>      Applying: First Commit

Hi Weijie,

Thank you for putting this patch together and for the credit. The
conversion to the modern command layout keeps the guide fully up to
date with current Git usage practices.

Reviewed-by: Nguyen Duc Thinh <ducthinh100812@gmail.com>

