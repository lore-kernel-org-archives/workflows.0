Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750A02DF14B;
	Fri, 14 Nov 2025 20:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763151461; cv=none; b=ijQz1EcTk8rHkfJRp2SjNMwgxzwEJAwac4FC7LSYz8t54qxBtF/o29re21J8AKimOrwJIo4tIBpRjxRwU79qbGTYT867HddPhOTnp16jzC/qGoSi2nkC9NBjmIb7KTJaf+AR+BivT/KDOXjYUKW1XA6mUqSfaLbbfcMMBrigS/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763151461; c=relaxed/simple;
	bh=x3xwBrgsQDW8dhEwcwN2csogXRtT++IpSkrVGMEiuaE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDUUmtwqB11khRfSmJJjEZESLiIN0kFB0c8HDeQHB2bAnyatkRhmYgBTe0U8eLqa2d89/HJuVp/3dxL35ijNKaDh/k9iueKeG9iVeop9c+BaL9jSv6/cYUQ/6zMRdReR7qFy3P8ImkRJq5zWJwO/JKn0e+pg6v9ZKximqK3yJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RpoQAxwB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RpoQAxwB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80978C16AAE;
	Fri, 14 Nov 2025 20:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763151460;
	bh=x3xwBrgsQDW8dhEwcwN2csogXRtT++IpSkrVGMEiuaE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RpoQAxwB8d6dgbid88qAu+4Jl60irnMrIZYHmqlo7HkOUnL/TRSxm55/OSax3Xy5U
	 UUyv/fi498kCg1628qyND6Ad86Ot8KBpRIbdUnf9t9qMMxmzqnocWzkMalVxbt7KSY
	 bCd8A6m7LsHRT4yMgpgtwidr2Nv1YpBsXlp85qR+antFWcU5B3rn3CtETUtTF0UtHF
	 FJWIAE6dq7TuxwHmWTJ1TQG77Ihj1H9kVZgqjWY1mnJWFkfgCbpqFHqrlF+nSh6if8
	 gqjx9OIGF1hxXzcgvlNrPcAD4Xk/wmDKghTIY60VZK0JODeGoZyyiLyoUyszaFDpWW
	 vayuJYkG+TUng==
From: SeongJae Park <sj@kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	dave@sr71.net,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
Date: Fri, 14 Nov 2025 12:17:37 -0800
Message-ID: <20251114201738.3212-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251114183528.1239900-1-dave.hansen@linux.intel.com>
References: 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 14 Nov 2025 10:35:28 -0800 Dave Hansen <dave.hansen@linux.intel.com> wrote:

> In the last few years, the capabilities of coding tools have exploded.
> As those capabilities have expanded, contributors and maintainers have
> more and more questions about how and when to apply those
> capabilities.
> 
> Add new Documentation to guide contributors on how to best use kernel
> development tools, new and old.

Thank you for writing this!

[...]
> +As with all contributions, individual maintainers have discretion to
> +choose how they handle the contribution. For example, they might:
> +
> + - Treat it just like any other contribution.
> + - Reject it outright.
> + - Treat the contribution specially like reviewing with extra scrutiny,
> +   or at a lower priority than human-generated content

Nit.  The ending period is missed?

Reviewed-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]

Sent using hkml (https://github.com/sjp38/hackermail)
