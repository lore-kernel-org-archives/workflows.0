Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3693C1A9FA4;
	Thu, 30 Apr 2026 00:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777510416; cv=none; b=uAvZk0TOdMNhiVYSyL1wfA42f95lKQgZmhV8fJlxwk+pGfq/LiEr61bVU8woE2M20CplEoySsLkfd2E7jyIz6IcN2C335PcYSGm4VzHlQIjb1+BPfR6HuIjj5iBNKoM0AUDuJ4/kXGeWcuWl8rCXh165WPpvvUJRFIkQlqqHeHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777510416; c=relaxed/simple;
	bh=zjCoBFwYSmjGFkHi/Pxcq/dfA8Mbal7PpAw+Jp2oKko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oB9y3Ic4uUyLLy9Gof1KyxhSryNP1jUY917HZBbJhYgGtb4FKhtUXjUQnGHFXbrqgduYwTI1jKAKlcjBlsCLm8p+W3sDnZwf5L38aEbKIJX47KuvJlD9xRFTtvdFIW8DZRqeq1bZ690gojwz5k9FPTn2BMsGU4YT01+Tjql0LSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qpj3Qm0W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qpj3Qm0W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A759C19425;
	Thu, 30 Apr 2026 00:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777510415;
	bh=zjCoBFwYSmjGFkHi/Pxcq/dfA8Mbal7PpAw+Jp2oKko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qpj3Qm0Wzn2hcQstA8JGWaprxISvZUM8AAu14+3bt2qhRgD8n6juV6/vNXPkVkBkk
	 kZDJ4H+aKjZf+o55CixvCLSMYV6IEDl5kj09gJs/bH/72ASNq6OGI30PRX+sLFVCDg
	 ohW+ZRr6QBHWRYRRkypg/1GHW1JtUwBvGYtqo0iodkPolOX/ETKSriP6lXSBlTT6mR
	 bsUqfgwMbL6r0co6X2lmiEiLSQZskYN/ycTKc6YW33cdEnP3iIjkbwC8zD0B8bqVAw
	 +RFONzK2h50YB0Rq3AaOeIkfl4APevD6ZuVMlPk30pl41TuqQkcFpwYVQwJ7Ke5ISG
	 L3i9nf6gEmjaQ==
From: SeongJae Park <sj@kernel.org>
To: Manuel Ebner <manuelebner@mailbox.org>
Cc: SeongJae Park <sj@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	workflows@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 1/3] Documentation: adopt new coding style of type-aware kmalloc-family
Date: Wed, 29 Apr 2026 17:53:33 -0700
Message-ID: <20260430005333.113698-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260429071445.309733-2-manuelebner@mailbox.org>
References: 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 29 Apr 2026 09:14:44 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:

> Update the documentation to reflect new type-aware kmalloc-family as
> suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> and family")
> 
> ptr = kmalloc(sizeof(*ptr), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kmalloc(sizeof(struct some_obj_name), gfp);
>  -> ptr = kmalloc_obj(*ptr);
> ptr = kzalloc(sizeof(*ptr), gfp);
>  -> ptr = kzalloc_obj(*ptr);
> ptr = kmalloc_array(count, sizeof(*ptr), gfp);
>  -> ptr = kmalloc_objs(*ptr, count);
> ptr = kcalloc(count, sizeof(*ptr), gfp);
>  -> ptr = kzalloc_objs(*ptr, count);
> 
> Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
