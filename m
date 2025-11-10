Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126632DE6E3
	for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 17:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762796662; cv=none; b=qbplsm5HG4cE3WiuzM6vcRckyYJgWxKXFwAjSSVgTx6/bD6cfG6Tr4EldXF0EFSBEhLG9ObX3Nd/MxjbJNXbDiud27flsA+bK7xifA7wiFWZi0naNuZr4PbnndVc/muwnWpTpgNc1XhjV+varIe0xTqjNsW36maBXhV/+qGrMRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762796662; c=relaxed/simple;
	bh=aJkXTAL7hko1vF8GGGqXUOq9IdfVkF6MkoKhNUkblxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bCb9YCJ+0RMoE0JLgSOuijs1upMvWMstUa0ZVdEsJPNmZzEspAUOGJBlziqiCiyL6gVKPW77tIDGqr7RSWzWmiDdGTc8xhZNzaSroNNJ7xdk7SBe39aNankFOGDcndz+lt4lY5fBN2Mrc7BmvGV7Gdit9viLyJ10THdr6qArQtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F7M8HfQV; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F7M8HfQV"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b4736e043f9so456866166b.0
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 09:44:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1762796659; x=1763401459; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aCzk/qbLhCwNEv+1dx5n8o3k2LQtS9clijGkZLAmnGM=;
        b=F7M8HfQVhlv2KKNovJKtL4c8+0OwP0jdMvhmNmHpwdjoiUmwmWK2scDj0IGYItdHAL
         PwTjNno3sGBg0CHKQ7H9lUl+RUAxC/GeWDZ7pO/h0+REEb5Y88VSoHcRoLmItu2nmcOL
         EHbTjxI6GwSUgZr+G2N+vxXS+tiEpDiKPps9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762796659; x=1763401459;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aCzk/qbLhCwNEv+1dx5n8o3k2LQtS9clijGkZLAmnGM=;
        b=IcjY4Gl/fjcFXOLHi4Nv/AiBmTaN3oMNd17PGpl61/k2lvHCc1ufmULnDLZ3d+A+Ac
         5AAh8YwY5F1KV/f+A0tB50y+HwwtT38Y8dio7k7zOUC4hQXLnss2EWsCfwbo2NZ7oPPd
         2XGrH5nUH79BxLAWZy8iVP0r5650VXoKXDX+InelzXwabynRnKHjpTVhNYH6Eum86oEc
         UHDdfbkZhdxiSkyVNVjC0JafOm8SUJSEpiikbp0XymDg618h5jKewj4HeB8fxRyIHWxb
         5uZGfwt63WalmlH/TplW9nmMuKz+HPxWab5peK+DCQ8OAM70LCKwr/9HOeVSzDnlOamd
         dVLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVtk4sJlNJqZOoM1YEpGiKwUfxd3hBmZ92n+eRP8pMbe/tOmXDymtvasEk/VhrP11CJU7fJOR6DRsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx7nQ+uRJALlh8hAUgc2kN0EEGwqRTfnfpS8cAacHzlDt3xbY+
	46czatAVwlBPrP3Rvo15Mj5FZLCbHHDR79hcEFkOrEcH2IaflIbHJRyvIjNDVKsQuQXeUK/74kP
	6zZRSNXY=
X-Gm-Gg: ASbGnct/PVUzt3UnYYM6VWqXFiNcEOpvsiWxzG8uEaJU8O87Jxcmyzz8TrNYh26DJnz
	r2O2IhJ/vLIL0NVaho2gTxsTpfuwg501i30phWQZs1Z1xyQS4cTKYJYl1sVxHYV/1vm3uDFRssH
	IXsW7cgCtrYLgCuNnicIg+GMq8XU7QN4B6gycY/uygRL4OHtXrYpI5paLhhOdMHESttnxgno9z5
	iVLN0E56OKrh5KqiF8fJBKYlM7SsQw0q2QCEqGngT0uDSqUwE7Y5LRA8oBLAfu9BOVZ9TBretM/
	UBPOvN7/ARWkX1ueamGJ1vHTgBpk/p6FHU2YhCpRGgyaya0401yGSCO/ylT5jVeZE/XFGyHZeGz
	Op90j5gBtPdV5lHlq37MOAbRDvHlsPC5Z1CY6lPUR/OGDBAVg7RmSjLScnjbZCLkg+z32++UMnl
	ImiOUf78DxHyHBJc8uvT7jyFyLW5ilYhhp0p/jli+BCsZHqTV1qA==
X-Google-Smtp-Source: AGHT+IHt3O+fDJakHleB/n2uF1jxCMd7dDnknIhEwA9N1l3jzuUi6F1U63wiMEgmZDGUPoIEWml+xQ==
X-Received: by 2002:a17:907:3e0a:b0:b72:746c:1100 with SMTP id a640c23a62f3a-b72e044ed3cmr1042629566b.32.1762796659254;
        Mon, 10 Nov 2025 09:44:19 -0800 (PST)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bfa24d1fsm1124657766b.73.2025.11.10.09.44.17
        for <workflows@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 09:44:18 -0800 (PST)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b72dc0c15abso437132766b.1
        for <workflows@vger.kernel.org>; Mon, 10 Nov 2025 09:44:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWl4GG22j0YUUC+t8h3qzjgYiLls6snoc0+zxF95DZlqLs5KN+/r1q6+0W0f1Ks7SAeaBpMVIK+74=@vger.kernel.org
X-Received: by 2002:a17:907:3dab:b0:b71:ea7c:e4ff with SMTP id
 a640c23a62f3a-b72e028a45cmr778784666b.6.1762796656727; Mon, 10 Nov 2025
 09:44:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: workflows@vger.kernel.org
List-Id: <workflows.vger.kernel.org>
List-Subscribe: <mailto:workflows+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:workflows+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251105231514.3167738-1-dave.hansen@linux.intel.com>
 <653b4187-ec4f-4f5d-ae76-d37f46070cb4@suse.cz> <20251110-weiht-etablieren-39e7b63ef76d@brauner>
 <20251110172507.GA21641@pendragon.ideasonboard.com>
In-Reply-To: <20251110172507.GA21641@pendragon.ideasonboard.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Nov 2025 09:44:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
X-Gm-Features: AWmQ_bkg_IidkR66xZb4S-deqo35yAvtxVL7xdWRUcGFEchFZ0rJJKEs7XvoLmY
Message-ID: <CAHk-=wgEPve=BO=SOmgEOd4kv76bSbm0jWFzRzcs4Y7EedpgfA@mail.gmail.com>
Subject: Re: [PATCH] [v2] Documentation: Provide guidelines for tool-generated content
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Christian Brauner <brauner@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, linux-kernel@vger.kernel.org, 
	"workflows@vger.kernel.org" <workflows@vger.kernel.org>, 
	"ksummit@lists.linux.dev" <ksummit@lists.linux.dev>, Steven Rostedt <rostedt@goodmis.org>, 
	Dan Williams <dan.j.williams@intel.com>, "Theodore Ts'o" <tytso@mit.edu>, 
	Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Nov 2025 at 09:25, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Mechanical transformations are often performed with Coccinelle. Given
> how you mention that tool below, I wouldn't frame it as out of scope
> here.

Honestly, I think the documented rule should not aim to treat AI as
anything special at all, and literally just talk about tooling.

Exactly because we've used things like coccinelle (and much simpler
tools like 'sed', for that matter) for ages.

IOW, this should all be about "tool-assisted patches should be
described as such, and should explain how the tool was used".

If people send in patches that have been generated by tools, we
already ask people to just include the script in the commit message.

I mean, we already have commit messages that say things like

    This is a completely mechanical patch (done with a simple "sed -i"
    statement).

when people do mindless conversions that are so straightforward that
the actual sed patch isn't even documented (in that case is was
something like just

   sed -i 's/__ASSEMBLY__/__ASSEMBLER__/'

or whatever), and in other cases people include the actual script
(random example being commit 96b451d53ae9: "drm/{i915,xe}: convert
i915 and xe display members into pointers").

I think we should treat any AI generated patches similarly: people
should mention the tool it was done with, and the script (ok, the
"scripts" are called "prompts", because AI is so "special") used.

Sure, AI ends up making the result potentially much more subtle, but I
don't think the *issue* is new, and I don't think it should need to be
treated as such.

                 Linus
