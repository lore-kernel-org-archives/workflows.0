Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C443595D;
	Wed, 26 Nov 2025 01:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764119581; cv=none; b=qM84FXxNFckFUfH8H54+uUp0lRtPgg9ANociKlVok41vYMrU/7IyUB+YZLTPPtjJHkvjUPFR9m7vCBga7gIMIpLcGUgolahJTgzrOtic9lPHkYTyyY0ytBuVpKvVk3gwmVaA48F9OFXBB7aFlbS60HHscF9HMHTVrMlmNSfk/1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764119581; c=relaxed/simple;
	bh=T13E0ORuIwgEnfCcozPc/lnalkysVj1GgrcIGin497U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lfYH1f9a5JD0UzPkJvAKiHkfewOEsKKp45qsmWnGg5hDJQb5UDEB/Clwi/IFtmV09CbToeZLI/rL+uBvKPyl83oc9GiaZgnUlLh+Rw+XAYL+C2lIwpUvQ22diy3DAQ6+X1nK0GZ+nKBlAaDcZA8amJlpyzTXr7t+FvVlXIpZABg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=klM15bMM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="klM15bMM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 862E2C4CEF1;
	Wed, 26 Nov 2025 01:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764119580;
	bh=T13E0ORuIwgEnfCcozPc/lnalkysVj1GgrcIGin497U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=klM15bMMTZnYWbP090Jg7p0PqFLvCZuUKh7psOF9CpXrooQNHJhXEd7EakgFRe6M1
	 RlIDwVgq2XdC4Lo6uHaKQFLsGYuEc4Y8ROLGwnwodtSimb8eYEEAg4z4e70vIRnNlj
	 FQPOI1LZsKPx8/J2vvK4BATTdGa1ylEp7WZZhD8AZau1DeCuykZUYC7RW55g4Qc0Iq
	 M/pfVVPXJ4oqod9FiFC+tIdvWFxKa6RMiqq3gOXlW+WwhK3PZD3PNMqVYPP3wowr95
	 avogfmQG0dxxjTosXgA3t5/r+aAEzNpN+yq9CIIGKNM1JQJWERwdtaR/Z0AGYVd+k0
	 J5UBXe04Clx+g==
From: SeongJae Park <sj@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	corbet@lwn.net,
	linux-doc@vger.kernel.org,
	josh@joshtriplett.org,
	kees@kernel.org,
	konstantin@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	rostedt@goodmis.org,
	workflows@vger.kernel.org,
	joe@perches.com,
	rdunlap@infradead.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH v5] README: restructure with role-based documentation and guidelines
Date: Tue, 25 Nov 2025 17:12:52 -0800
Message-ID: <20251126011253.74218-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251121180009.2634393-1-sashal@kernel.org>
References: 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 21 Nov 2025 13:00:09 -0500 Sasha Levin <sashal@kernel.org> wrote:

> Reorganize README to provide targeted documentation paths for different user
> roles including developers, researchers, security experts, and maintainers.
> 
> Add quick start section and essential docs links.
> 
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Kees Cook <kees@kernel.org>

Reviewed-by: SeongJae Park <sj@kernel.org>

> ---
> 
> Changes since v4:
> 
>  - Remove explicit reference to GPLv2
>  - Fix up the commit message to drop AI blurb
> 
>  README | 160 +++++++++++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 149 insertions(+), 11 deletions(-)
> 
> diff --git a/README b/README
> index fd903645e6de0..1fc993d7cf07e 100644
> --- a/README
> +++ b/README
> @@ -1,18 +1,156 @@
[...]
> +Documentation can be built with make htmldocs or viewed online at:
> +https://www.kernel.org/doc/html/latest/
> +
> +
> +Who Are You?
> +============
> +
> +Find your role below:
> +
> +* New Kernel Developer - Getting started with kernel development
> +* Academic Researcher - Studying kernel internals and architecture
> +* Security Expert - Hardening and vulnerability analysis
> +* Backport/Maintenance Engineer - Maintaining stable kernels
> +* System Administrator - Configuring and troubleshooting
> +* Maintainer - Leading subsystems and reviewing patches
> +* Hardware Vendor - Writing drivers for new hardware
> +* Distribution Maintainer - Packaging kernels for distros
> +
> +
> +For Specific Users
> +==================
> +
> +New Kernel Developer
> +--------------------
[...]
> +Distribution Maintainer
> +-----------------------
> +
> +Package and distribute the kernel:
> +
> +* Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
> +* ABI Documentation: Documentation/ABI/README
> +* Kernel Configuration: Documentation/kbuild/kconfig.rst
> +* Module Signing: Documentation/admin-guide/module-signing.rst
> +* Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
> +* Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
> +
> +
> +
> +Communication and Support
> +=========================

Nit.  Having only two blank lines above this section would make this document
look more consistent.


Thanks,
SJ

[...]
