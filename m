Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A4C13790B;
	Thu, 30 Apr 2026 01:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777510821; cv=none; b=n3JkXBcUdrQTGmUgbOG+J1yeqMKbFJc6nkPhs9ISFb8xBEAy2UG0hYw8hQMFMr3kJ7RKE63fXJy/0eFm1L+jMIfeKH/wYIiZShdjSekld70tKMhigkP3nlAd522Yh4i2mDS6JbpiAvpismcyfVpGsH/UKrcRkdrD/p9qoqytjrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777510821; c=relaxed/simple;
	bh=wSFWxLyFmwkXCFlEqXdpW5aD9S/d9XFlVOX1pPmAbnc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rH/TyOi9c9LT8mupX2pr3ltVnp6Mk2Hq/QMtelB0n9KgHPkzbc2GbzAIFg/BcMziJ69SqihvZPSjeer+LO0k2Aa2XFcw4b7PQFL2TknA8Yq4WtksVPdltIc1IzpCq3D2jPvPxrHOV+zeaHCwMze1G2G3Ih+JTDZzrIuXs2D6FIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H8++NKB0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H8++NKB0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDFCC19425;
	Thu, 30 Apr 2026 01:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777510821;
	bh=wSFWxLyFmwkXCFlEqXdpW5aD9S/d9XFlVOX1pPmAbnc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=H8++NKB04PVoYU78Xho68s/d2aq4pwIy99pVtsI8OXDHx5luQL//4gQmPqP2fMJA9
	 vRCzfpwUs1OkROvSO/XcudpFJjqJ39Ra64kLarQC/6l3IodxJUqcrfUr/AK+OJN49m
	 BGHRXxwNcg0U0ccm7CoYlW+RLuIhkACKb/IJCtIkmW9x2KdvNjEj9YLOyD4o+6AKDI
	 B53z36PpE+a6YdMVFY+pllqe7epGTOsbX/Kia4wEzMVVtjtIMFGUlhNV+e9Nkwl5sM
	 uUPPgJcPCki5tj1/WihbxoIGi2+dCZWENwsyzTanrMHyudLJefh2RVOv7CblI4iPZe
	 W8UFXOeJC6NXA==
From: SeongJae Park <sj@kernel.org>
To: SeongJae Park <sj@kernel.org>
Cc: Manuel Ebner <manuelebner@mailbox.org>,
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
Date: Wed, 29 Apr 2026 18:00:12 -0700
Message-ID: <20260430010013.113971-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430005333.113698-1-sj@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 29 Apr 2026 17:53:36 -0700 SeongJae Park <sj@kernel.org> wrote:

> On Wed, 29 Apr 2026 09:14:44 +0200 Manuel Ebner <manuelebner@mailbox.org> wrote:
> 
> > Update the documentation to reflect new type-aware kmalloc-family as
> > suggested in commit 2932ba8d9c99 ("slab: Introduce kmalloc_obj()
> > and family")
> > 
> > ptr = kmalloc(sizeof(*ptr), gfp);
> >  -> ptr = kmalloc_obj(*ptr);
> > ptr = kmalloc(sizeof(struct some_obj_name), gfp);
> >  -> ptr = kmalloc_obj(*ptr);
> > ptr = kzalloc(sizeof(*ptr), gfp);
> >  -> ptr = kzalloc_obj(*ptr);
> > ptr = kmalloc_array(count, sizeof(*ptr), gfp);
> >  -> ptr = kmalloc_objs(*ptr, count);
> > ptr = kcalloc(count, sizeof(*ptr), gfp);
> >  -> ptr = kzalloc_objs(*ptr, count);

Forgot asking this, sorry.  Shouldn't 'gfp' parameters be kept?

> > 
> > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> 
> Acked-by: SeongJae Park <sj@kernel.org>

My Acked-by: is still valid regardless of your answer to my trivial question.


Thanks,
SJ

[...]
