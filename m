Received: from blackbird.sr71.net (blackbird.sr71.net [198.145.64.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CFB28643C;
	Mon, 10 Nov 2025 17:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.145.64.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796884; cv=none; b=dsgoewsKc8og7P3PSWXSI+Tmnsxqq/qyUaGoC+sy15/eFEwosnu8Vtup2eFZodXvVtPxvmnrwkhvZZep/ICYUAe2C2ozR3y85Eu6MCH0/xHZIeebfO3b5p6VWXzn2GrmktIGSUFMcOWFZ7CxJmYkvP+wp2UczlbbnA/S/CjrNaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796884; c=relaxed/simple;
	bh=4iJ0iHDZd+yoC6UHBTaQrxmaV6kxPQ/saCltDKoD8bM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=We/7UK97CSqQMWHN70UzmGFyLaLUCL10LaH1rmDfTbYqkbIbJCtuIWRuThTsoO27KIf71lnQMdyR01145bovIc4QHFGebS4Sccvxo5wUlFdueVTd1bWoaCKsBozZJ9aysuQZSh8RBlG+D0tk80pg8Fx4MSP+41pxSP2J5dhPmZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net; spf=pass smtp.mailfrom=sr71.net; arc=none smtp.client-ip=198.145.64.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sr71.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sr71.net
Received: from [0.0.0.0] (unknown [134.134.139.75])
	(Authenticated sender: dave)
	by blackbird.sr71.net (Postfix) with ESMTPSA id E283D2019E;
	Mon, 10 Nov 2025 09:41:55 -0800 (PST)
Message-ID: <b9eb9f19-9b77-4ece-ac54-9e25a801c565@sr71.net>
Date: Mon, 10 Nov 2025 09:41:54 -0800
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] Documentation: Provide guidelines for tool-generated
 content
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Christian Brauner <brauner@kernel.org>
Cc: Dave Hansen <dave.hansen@linux.intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org,
 "workflows@vger.kernel.org" <workflows@vger.kernel.org>,
 "ksummit@lists.linux.dev" <ksummit@lists.linux.dev>,
 Steven Rostedt <rostedt@goodmis.org>, Dan Williams
 <dan.j.williams@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Kees Cook <kees@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>,
 Shuah Khan <shuah@kernel.org>
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com>
 <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz>
 <20251110-weiht-etablieren-39e7b63ef76d@brauner>
 <20251110172507.GA21641@pendragon.ideasonboard.com>
From: Dave Hansen <dave@sr71.net>
Content-Language: en-US
In-Reply-To: <20251110172507.GA21641@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/25 09:25, Laurent Pinchart wrote:
>>>> + - Purely mechanical transformations like variable renaming
> Mechanical transformations are often performed with Coccinelle. Given
> how you mention that tool below, I wouldn't frame it as out of scope
> here.

The key here isn't which tool is used, it's how it's used.

If you go use Coccinelle for pure variable renaming, you don't need to
mention it. Same as if you use perl or vim to do a s/foo/bar/.

That said, if you choose to attach your trivial variable renaming
Coccinelle script, everyone will be better off for it.
