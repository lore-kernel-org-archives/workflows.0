Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075022;
	b=34kaCAywKwd1dCsf2Z9nyHUwNjSJLilBCbN6+ZHMmU8QTyit6l0fdHnyQwsH5MmdeHCd
	 1h7/rmz1V5oONC7YvejR3n9zjmT7yLrsmGqOp5/uOVmUfp/NOaA9VMqtcEcPWwgv19KYH
	 5obTXk45wvak8th9f6vxGfPsBg04aRNa9fb1/pF8FWlB52zgFIvRL0cYNxCH5qz3/6pPa
	 VKhUllmhHE4nb2tqLhOAD5Jq8Ko2WKQs6XXiJdiRcdRN1fqXdh6RGmS93Z6dJOX+jc9pv
	 twzMKb+1GE7lg7POd5fj5+Xu8zY8c4FnnpY1B6MWn6YJIC0m/KWq6fEWJaFhDKcJlzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075022;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=GC19D8QX3e0BMtqC3RPLEBVs8/GW0WZwei27hG/CDHQ=;
	b=sEwP9f6o4rSo+Kod9fwVlYicTQjk8uwZcog3L7XPtLwKigV5NQwwiVHYRR36/7usI0QN
	 SJDwAIOoKQ/FsPPuc/ZCWuht6MgI/xPwnmdfB7KpxiiCsl4Zx2S5DQ5KJTl2UkN6c9XIz
	 hp3bvDNScC+U49ylDIqqUFf82eW3Z43HJ3wePeJMjDSl3ppY7MadEqbacjdv+yiMDtkVR
	 jqopjHrcZ1+ZCwVdhf8G7V/p/9zwNwse3ctdx0tb3u5wt+bAdwA86OzIcOT1u4mcijRt9
	 9aJx/d3FhKSL/bOvLSRaxj3xKDlBgz2x5zyEx72zY6+H8KzE44VypcBNGN2eTGcv1AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="P5iT/6Xv";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8D0606A320;
	Thu, 19 Nov 2026 07:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P5iT/6Xv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186F91F000C5;
	Thu, 19 Nov 2026 07:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795075022;
	bh=GC19D8QX3e0BMtqC3RPLEBVs8/GW0WZwei27hG/CDHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P5iT/6Xvlz2DiMKIeDEjwktDfpIisglfro6uw6YzeBybw9KYw0q9HUASRGPCx7e/x
	 yAE/72ZGCybiFkav/cusuFOSAbJ7+rDCbQtZg0P7x4hURny1d46AM+RLqu9cCBJIri
	 GuIZCnVr1CeM5iZcae/uj5K9tcRwdYrUt5mUZbl01/DQkzm6WBraMxkJCDSkF/sy8S
	 YbkjMlaRafiV6MT5KG8usCCfhW5VEPWzGWBU5b6r0JOTPb30TssHhco4Whd8IgMbnS
	 a834awNrlhg97f5/ZA8Vnw8SQzOsrDxiNLfzfLMpHpsmkxvmsjQb2aH9ZuEoC32Jzh
	 OJcklxorwNEYA==
Date: Thu, 19 Nov 2026 09:56:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Muchun Song <songmuchun@bytedance.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Chris Down <chris@chrisdown.name>,
	David Hildenbrand <david@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Muchun Song <muchun.song@linux.dev>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Pranjal Shrivastava <praan@google.com>,
	Ketan <ketan.kishore@oss.qualcomm.com>,
	Mostafa Saleh <smostafa@google.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Sashiko <sashiko-bot@kernel.org>, kasan-dev@googlegroups.com,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 6/7] mm/page_ext: inline unchecked page extension
 lookup
Message-ID: <av6rwy2ysqCVdcC4@kernel.org>
References: <20261119065812.89959-1-songmuchun@bytedance.com>
 <20261119065812.89959-7-songmuchun@bytedance.com>
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Post: <mailto:workflows@vger.kernel.org>
List-Help: <mailto:workflows+help@vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
List-Owner: <mailto:workflows+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119065812.89959-7-songmuchun@bytedance.com>

On Thu, Nov 19, 2026 at 02:58:11PM +0800, Muchun Song wrote:
> The KMSAN runtime needs an unchecked page extension lookup that can be
> inlined into its uninstrumented compilation unit while page_ext.c remains
> instrumented.
> 
> Provide an inline lookup for this use case while keeping the existing RCU
> checks for other callers.
> 
> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Chris Down <chris@chrisdown.name>
> Tested-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
> v3:
> - Collect Reviewed-by and Tested-by from Chris Down
> 
> v2:
> - Add a preparatory patch that inlines the unchecked lookup (suggested
>   by Chris Down)
> - Use a PFN interface to avoid architecture header-order dependencies
> ---
>  include/linux/page_ext.h | 46 ++++++++++++++++++++++++++++++
>  mm/page_ext.c            | 60 +++-------------------------------------
>  2 files changed, 50 insertions(+), 56 deletions(-)

-- 
Sincerely yours,
Mike.
