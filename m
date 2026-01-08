Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD601F4C8E;
	Thu,  8 Jan 2026 00:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767830419; cv=none; b=mYzz14WvDBpo41rx/3sjSpooKhUIlHlQAGFJqJBcxxefwSekexEKrEuxMcxtcctxsAYNqbP3RBg8S1WlgsZbAJKupCujyvcJfRkj2dsyEpImqxpFv89ojs2OKh/JsenMnhCK8QxAuv77amBlZ1+e+X3cPXFFPWOs5NlooXdhYZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767830419; c=relaxed/simple;
	bh=nt/IjTA8WEC4Dn5B7TI10r5rQk9r4/+LnWZdcevGEFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l2Jj+cLKA50oTuMCSSPqmqsm017yZUa20sXpWnLKYlZuKPGCghX/HxHOq/Z0YJSYP1yf6Swxj6TjwZ7zXTQrT1oTrUFiaVd1wn4UytvBS1hyJY2jOr7t+b/iTVmM2uAFawGRbINIkruXsUhRAVXTvi5zxSEFRRZN21BSNB7rq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Im2k0OwH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Im2k0OwH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3071C4CEF1;
	Thu,  8 Jan 2026 00:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767830419;
	bh=nt/IjTA8WEC4Dn5B7TI10r5rQk9r4/+LnWZdcevGEFw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Im2k0OwHc9uMkr11Ib0sKQTrLLbcSfNB3MoHBeSqmAv7sSELyCKDMymfHcLWrMFzn
	 bcHvB/GekBTPHna5H3HHinoWvorozKxx8X0YWzpwost4C9h4yAStryL0OC6ovqftOZ
	 98b4ruXoxCxX+kWU325qY1kg0a1nhyqwBRoRqwGzUgnHsLk/cJv0B1aUv1DQujEpah
	 zm3ZaFtMMPjtt1Jg5MxBvmHebLDQl8i+lA4jItbkBr2J2b0S5vRY3pLtiHsUhtkC+3
	 IqBuMYGSz5cl9drD32PZcNX0D9dblmnPY2RBX/s/xfiRw7/vGoqpKBW26c4/XWSU+g
	 eEICIAaKMn7gw==
From: SeongJae Park <sj@kernel.org>
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	NeilBrown <neilb@ownmail.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Theodore Ts'o <tytso@mit.edu>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vlastimil Babka <vbabka@suse.cz>,
	workflows@vger.kernel.org,
	ksummit@lists.linux.dev
Subject: Re: [PATCH] [v3] Documentation: Provide guidelines for tool-generated content
Date: Wed,  7 Jan 2026 16:00:16 -0800
Message-ID: <20260108000017.65682-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106205105.4037716-1-dave.hansen@linux.intel.com>
References: 
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Nit.  Apparently this is v4, not v3?  I show v3 from
https://lore.kernel.org/20251114183528.1239900-1-dave.hansen@linux.intel.com

On Tue,  6 Jan 2026 12:51:05 -0800 Dave Hansen <dave.hansen@linux.intel.com> wrote:

[...]


Thanks,
SJ
